// ============================================================
// Fichier : lib/screens/detail_screen.dart
// Rôle    : Écran de détail affiché quand l'utilisateur appuie
//           sur une carte. Montre toutes les informations
//           d'une entrée.
// ============================================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../models/entry.dart';
import '../services/favorites_service.dart';

class DetailScreen extends StatelessWidget {
  // L'entrée à afficher en détail
  final Entry entry;

  const DetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final categoryColor = Color(entry.category.colorValue);

    return Scaffold(
      // ── Barre du haut ──
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A3A5C),
        foregroundColor: Colors.white,
        // Titre = emoji + nom de catégorie
        title: Text(
          '${entry.category.emoji}  ${entry.category.displayName}',
          style: GoogleFonts.merriweather(fontSize: 16),
        ),
        elevation: 0,
        actions: [
          // Bouton favori
          ListenableBuilder(
            listenable: FavoritesService(),
            builder: (context, _) {
              final isFav = FavoritesService().isFavorite(entry.id);
              return IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.redAccent : Colors.white70,
                ),
                onPressed: () => FavoritesService().toggle(entry.id),
              );
            },
          ),
          // Bouton partage
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.white),
            tooltip: 'Partager',
            onPressed: () {
              final text = _buildShareText();
              SharePlus.instance.share(ShareParams(text: text));
            },
          ),
        ],
      ),

      // ── Corps de l'écran ──
      body: SingleChildScrollView(
        // SingleChildScrollView permet de scroller si le contenu dépasse l'écran
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Bloc principal : le texte ──
            _buildTextBlock(categoryColor),

            const SizedBox(height: 24),

            // ── Section Signification ──
            _buildSection(
              icon: Icons.lightbulb_outline,
              title: 'Signification',
              content: entry.meaning,
              color: categoryColor,
            ),

            // ── Section Auteur (si disponible) ──
            if (entry.author != null) ...[
              const SizedBox(height: 16),
              _buildSection(
                icon: Icons.person_outline,
                title: 'Auteur',
                content: entry.author!,
                color: categoryColor,
              ),
            ],

            // ── Section Région (si disponible) ──
            if (entry.region != null) ...[
              const SizedBox(height: 16),
              _buildSection(
                icon: Icons.location_on_outlined,
                title: 'Région',
                content: entry.region!,
                color: categoryColor,
              ),
            ],

            // ── Section Origine (si disponible) ──
            if (entry.origin != null) ...[
              const SizedBox(height: 16),
              _buildSection(
                icon: Icons.history_edu_outlined,
                title: 'Origine',
                content: entry.origin!,
                color: categoryColor,
              ),
            ],

            // ── Tags / mots-clés ──
            if (entry.tags.isNotEmpty) ...[
              const SizedBox(height: 24),
              _buildTags(categoryColor),
            ],

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ── Widget : bloc du texte principal ──
  Widget _buildTextBlock(Color categoryColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        // Dégradé subtil de la couleur de catégorie
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1A3A5C),
            const Color(0xFF1A3A5C).withValues(alpha:0.85),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Grand emoji de catégorie
          Text(
            entry.category.emoji,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 16),
          // Texte principal entre guillemets français
          Text(
            '« ${entry.text} »',
            style: GoogleFonts.merriweather(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ── Widget : une section d'information (réutilisable) ──
  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha:0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: color.withValues(alpha:0.15),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône dans un cercle coloré
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha:0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 12),
          // Titre + contenu
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: color,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2C3E50),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Texte formaté pour le partage ──
  String _buildShareText() {
    final lines = <String>[
      '${entry.category.emoji} ${entry.category.displayName}',
      '',
      '« ${entry.text} »',
      '',
      entry.meaning,
    ];
    if (entry.author != null) lines.addAll(['', '— ${entry.author}']);
    if (entry.origin != null) lines.addAll(['', entry.origin!]);
    lines.addAll(['', '📖 Via Dictons de France']);
    return lines.join('\n');
  }

  // ── Widget : liste de tags ──
  Widget _buildTags(Color categoryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mots-clés',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade600,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10),
        // Wrap permet aux tags de passer à la ligne automatiquement
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: entry.tags.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: categoryColor.withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: categoryColor.withValues(alpha:0.3),
                  width: 1,
                ),
              ),
              child: Text(
                '# $tag',
                style: TextStyle(
                  fontSize: 12,
                  color: categoryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
