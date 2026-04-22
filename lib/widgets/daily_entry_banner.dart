// ============================================================
// Fichier : lib/widgets/daily_entry_banner.dart
// Rôle    : Bannière "Entrée du jour" affichée en haut de
//           l'écran d'accueil. Change automatiquement chaque jour.
// ============================================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/entries_data.dart';
import '../models/entry.dart';

class DailyEntryBanner extends StatelessWidget {
  // Callback quand l'utilisateur appuie sur la bannière
  final void Function(Entry entry) onTap;

  const DailyEntryBanner({super.key, required this.onTap});

  // Calcule l'entrée du jour de façon déterministe :
  // même entrée toute la journée, différente le lendemain.
  Entry _getDailyEntry() {
    final now = DateTime.now();
    // Numéro du jour dans l'année (ex: 1er janv = 0, 2 janv = 1, etc.)
    final startOfYear = DateTime(now.year, 1, 1);
    final dayOfYear = now.difference(startOfYear).inDays;
    // Modulo pour rester dans les bornes de la liste
    return allEntries[dayOfYear % allEntries.length];
  }

  @override
  Widget build(BuildContext context) {
    final entry = _getDailyEntry();

    return GestureDetector(
      onTap: () => onTap(entry),
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 8, 12, 4),
        decoration: BoxDecoration(
          // Dégradé or pour se démarquer visuellement
          gradient: const LinearGradient(
            colors: [Color(0xFF1A3A5C), Color(0xFF2C5282)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A3A5C).withValues(alpha:0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── En-tête : label + emoji catégorie ──
              Row(
                children: [
                  // Étoile dorée pour "du jour"
                  const Text('⭐', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 6),
                  Text(
                    'Entrée du jour',
                    style: GoogleFonts.lato(
                      color: const Color(0xFFD4AF37),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                  const Spacer(),
                  // Badge catégorie à droite
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha:0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${entry.category.emoji} ${entry.category.displayName}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ── Texte principal ──
              Text(
                '« ${entry.text} »',
                style: GoogleFonts.merriweather(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              // ── Auteur ou région ──
              if (entry.author != null || entry.region != null)
                Row(
                  children: [
                    Icon(
                      entry.author != null
                          ? Icons.person_outline
                          : Icons.location_on_outlined,
                      color: const Color(0xFFD4AF37),
                      size: 13,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      entry.author ?? entry.region ?? '',
                      style: const TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 6),

              // ── Indication "Appuyer pour en savoir plus" ──
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Voir le détail',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha:0.6),
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: Colors.white.withValues(alpha:0.6),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
