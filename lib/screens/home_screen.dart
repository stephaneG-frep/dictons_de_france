// ============================================================
// Fichier : lib/screens/home_screen.dart
// ============================================================

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/entries_data.dart';
import '../models/entry.dart';
import '../services/favorites_service.dart';
import '../services/notification_service.dart';
import '../services/theme_service.dart';
import '../widgets/daily_entry_banner.dart';
import '../widgets/entry_card.dart';
import '../widgets/search_bar.dart';
import 'detail_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  // Filtre région actif (null = toutes)
  String? _selectedRegion;

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

  // Toutes les régions distinctes des dictons
  List<String> get _availableRegions {
    final regions = allEntries
        .where((e) => e.category == Category.dicton && e.region != null)
        .map((e) => e.region!)
        .toSet()
        .toList()
      ..sort();
    return regions;
  }

  List<Entry> _getFilteredEntries(Category category) {
    var filtered = allEntries.where((e) => e.category == category).toList();

    // Filtre région (uniquement pour les dictons)
    if (category == Category.dicton && _selectedRegion != null) {
      filtered = filtered
          .where((e) => e.region == _selectedRegion)
          .toList();
    }

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
    _openDetail(allEntries[Random().nextInt(allEntries.length)]);
  }

  void _openQuiz() {
    // Passe la catégorie de l'onglet actif au quiz (sauf Favoris)
    Category? cat;
    switch (_tabController.index) {
      case 0: cat = Category.dicton; break;
      case 1: cat = Category.citation; break;
      case 2: cat = Category.expression; break;
      case 3: cat = Category.proverbe; break;
      default: cat = null;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => QuizScreen(initialCategory: cat)),
    );
  }

  // Active/désactive les notifications et informe l'utilisateur
  void _toggleNotifications() async {
    final granted = await NotificationService.requestPermission();
    if (!mounted) return;
    if (granted) {
      await NotificationService.scheduleDailyNotification(hour: 8);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Notification quotidienne activée à 8h00'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permission refusée — vérifiez les paramètres de l\'appli'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          // Bouton Quiz
          IconButton(
            icon: const Icon(Icons.quiz_outlined),
            tooltip: 'Quiz',
            color: const Color(0xFFD4AF37),
            onPressed: _openQuiz,
          ),
          // Bouton entrée aléatoire
          IconButton(
            icon: const Icon(Icons.shuffle_rounded),
            tooltip: 'Entrée aléatoire',
            color: const Color(0xFFD4AF37),
            onPressed: _openRandomEntry,
          ),
          // Menu (notifications + thème)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'notif') _toggleNotifications();
              if (value == 'theme') ThemeService().toggle();
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'notif',
                child: Row(children: [
                  Icon(Icons.notifications_outlined, size: 20),
                  SizedBox(width: 10),
                  Text('Notification quotidienne'),
                ]),
              ),
              PopupMenuItem(
                value: 'theme',
                child: ListenableBuilder(
                  listenable: ThemeService(),
                  builder: (_, __) => Row(children: [
                    Icon(ThemeService().isDark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                        size: 20),
                    const SizedBox(width: 10),
                    Text(ThemeService().isDark
                        ? 'Mode clair'
                        : 'Mode sombre'),
                  ]),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFD4AF37),
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
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
          // Bannière du jour (tous onglets sauf Favoris)
          if (_tabController.index < 4)
            DailyEntryBanner(onTap: _openDetail),

          // Filtres région (uniquement onglet Dictons)
          if (_tabController.index == 0)
            _buildRegionFilters(),

          // Barre de recherche
          AppSearchBar(
            hintText: 'Rechercher un mot-clé...',
            onChanged: (value) => setState(() => _searchQuery = value),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent(Category.dicton),
                _buildTabContent(Category.citation),
                _buildTabContent(Category.expression),
                _buildTabContent(Category.proverbe),
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

  // Chips de filtre par région (onglet Dictons)
  Widget _buildRegionFilters() {
    final regions = _availableRegions;
    if (regions.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Row(
        children: [
          // Chip "Toutes"
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: FilterChip(
              label: const Text('Toutes'),
              selected: _selectedRegion == null,
              onSelected: (_) => setState(() => _selectedRegion = null),
              selectedColor: const Color(0xFF2E7D32).withValues(alpha: 0.15),
              checkmarkColor: const Color(0xFF2E7D32),
            ),
          ),
          ...regions.map((region) => Padding(
            padding: const EdgeInsets.only(right: 6),
            child: FilterChip(
              label: Text(region),
              selected: _selectedRegion == region,
              onSelected: (_) => setState(() =>
                  _selectedRegion = _selectedRegion == region ? null : region),
              selectedColor: const Color(0xFF2E7D32).withValues(alpha: 0.15),
              checkmarkColor: const Color(0xFF2E7D32),
            ),
          )),
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
          Text(isFavorites ? '❤️' : '🔍',
              style: const TextStyle(fontSize: 48)),
          const SizedBox(height: 16),
          Text(
            isFavorites ? 'Aucun favori pour l\'instant' : 'Aucun résultat',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600),
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
