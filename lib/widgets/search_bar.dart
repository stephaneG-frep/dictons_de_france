// ============================================================
// Fichier : lib/widgets/search_bar.dart
// Rôle    : Barre de recherche réutilisable affichée en haut
//           de l'écran d'accueil.
// ============================================================

import 'package:flutter/material.dart';

// Widget "avec état" (StatefulWidget) car la barre de recherche
// doit gérer le texte saisi par l'utilisateur.
class AppSearchBar extends StatefulWidget {
  // Callback : fonction appelée à chaque changement de texte
  final ValueChanged<String> onChanged;
  // Texte indicatif affiché quand la barre est vide
  final String hintText;

  const AppSearchBar({
    super.key,
    required this.onChanged,
    this.hintText = 'Rechercher...',
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  // Contrôleur pour lire et effacer le texte du champ
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Important : libérer le contrôleur quand le widget est détruit
    // pour éviter les fuites mémoire.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Marge autour de la barre
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        // Ombre légère pour un effet "flottant"
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        // Appelé à chaque frappe de l'utilisateur
        onChanged: widget.onChanged,
        // Style du texte saisi
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF1A3A5C),
        ),
        decoration: InputDecoration(
          // Icône loupe à gauche
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade500,
            size: 20,
          ),
          // Bouton pour effacer le texte (affiché seulement si du texte est saisi)
          suffixIcon: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) {
              // On n'affiche le bouton effacer que si le champ n'est pas vide
              if (_controller.text.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade500,
                  size: 18,
                ),
                onPressed: () {
                  // Efface le texte et notifie le parent avec une chaîne vide
                  _controller.clear();
                  widget.onChanged('');
                },
              );
            },
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
          // Supprime la bordure par défaut de TextField
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
