// ============================================================
// Fichier : lib/screens/home_screen.dart
// Rôle    : Écran principal avec bannière "Entrée du jour",
//           4 onglets (Dictons / Citations / Expressions / Favoris)
//           et la barre de recherche.
// ============================================================

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/entries_data.dart';
import '../models/entry.dart';
import '../services/favorites_service.dart';
import '../widgets/daily_entry_banner.dart';
import '../widgets/entry_card.dart';
import '../widgets/search_bar.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // 4 onglets maintenant (+ Favoris)
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Entry> _getFilteredEntries(Category category) {
    var filtered = allEntries.where((e) => e.category == category).toList();
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filtered = filtered.where((e) {
        return e.text.toLowerCase().contains(query) ||
            e.meaning.toLowerCase().contains(query) ||
            e.tags.any((tag) => tag.toLowerCase().contains(query)) ||
            (e.author?.toLowerCase().contains(query) ?? false) ||
            (e.region?.toLowerCase().contains(query) ?? false);
      }).toList();
    }
    return filtered;
  }

  // Retourne les entrées favorites (filtrées par recherche si besoin)
  List<Entry> _getFavoriteEntries() {
    final favIds = FavoritesService().favoriteIds;
    var favorites = allEntries.where((e) => favIds.contains(e.id)).toList();
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      favorites = favorites.where((e) {
        return e.text.toLowerCase().contains(query) ||
            e.meaning.toLowerCase().contains(query) ||
            e.tags.any((tag) => tag.toLowerCase().contains(query));
      }).toList();
    }
    return favorites;
  }

  void _openDetail(Entry entry) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(entry: entry)),
    );
  }

  void _openRandomEntry() {
    if (allEntries.isEmpty) return;
    final randomEntry = allEntries[Random().nextInt(allEntries.length)];
    _openDetail(randomEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A3A5C),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Dictons de France',
          style: GoogleFonts.merriweather(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle_rounded),
            tooltip: 'Entrée aléatoire',
            onPressed: _openRandomEntry,
            color: const Color(0xFFD4AF37),
          ),
          const SizedBox(width: 4),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFD4AF37),
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          tabs: const [
            Tab(text: '🌾  Dictons'),
            Tab(text: '📜  Citations'),
            Tab(text: '💬  Expressions'),
            Tab(text: '📖  Proverbes'),
            Tab(text: '❤️  Favoris'),
          ],
        ),
      ),

      body: Column(
        children: [
          // ── Bannière "Entrée du jour" (visible sur tous les onglets sauf Favoris) ──
          if (_tabController.index < 4)
            DailyEntryBanner(onTap: _openDetail),

          // ── Barre de recherche ──
          AppSearchBar(
            hintText: 'Rechercher un mot-clé...',
            onChanged: (value) => setState(() => _searchQuery = value),
          ),

          // ── Contenu des onglets ──
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent(Category.dicton),
                _buildTabContent(Category.citation),
                _buildTabContent(Category.expression),
                _buildTabContent(Category.proverbe),
                // Onglet Favoris : se reconstruit quand FavoritesService notifie
                ListenableBuilder(
                  listenable: FavoritesService(),
                  builder: (context, _) => _buildFavoritesTab(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(Category category) {
    final entries = _getFilteredEntries(category);
    if (entries.isEmpty) return _buildEmptyState(isFavorites: false);
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20, top: 4),
      itemCount: entries.length,
      itemBuilder: (context, index) => EntryCard(
        entry: entries[index],
        onTap: () => _openDetail(entries[index]),
      ),
    );
  }

  Widget _buildFavoritesTab() {
    final entries = _getFavoriteEntries();
    if (entries.isEmpty) return _buildEmptyState(isFavorites: true);
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20, top: 4),
      itemCount: entries.length,
      itemBuilder: (context, index) => EntryCard(
        entry: entries[index],
        onTap: () => _openDetail(entries[index]),
      ),
    );
  }

  Widget _buildEmptyState({required bool isFavorites}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isFavorites ? '❤️' : '🔍',
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 16),
          Text(
            isFavorites ? 'Aucun favori pour l\'instant' : 'Aucun résultat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isFavorites
                ? 'Appuyez sur ❤️ pour sauvegarder une entrée'
                : 'Essayez avec d\'autres mots-clés',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
