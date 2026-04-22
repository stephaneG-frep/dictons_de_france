// ============================================================
// Fichier : lib/models/entry.dart
// Rôle    : Définit la structure de données d'une entrée
//           (dicton, citation ou expression).
// ============================================================

// Enumération des quatre catégories disponibles dans l'application.
enum Category {
  dicton,    // Dicton régional ou météorologique
  citation,  // Citation d'un auteur célèbre
  expression, // Expression idiomatique
  proverbe,  // Proverbe moral ou philosophique universel
}

extension CategoryExtension on Category {
  String get displayName {
    switch (this) {
      case Category.dicton:
        return 'Dicton';
      case Category.citation:
        return 'Citation';
      case Category.expression:
        return 'Expression';
      case Category.proverbe:
        return 'Proverbe';
    }
  }

  String get emoji {
    switch (this) {
      case Category.dicton:
        return '🌾';
      case Category.citation:
        return '📜';
      case Category.expression:
        return '💬';
      case Category.proverbe:
        return '📖';
    }
  }

  int get colorValue {
    switch (this) {
      case Category.dicton:
        return 0xFF2E7D32;   // Vert forêt
      case Category.citation:
        return 0xFF6A1B9A;   // Violet
      case Category.expression:
        return 0xFF1565C0;   // Bleu royal
      case Category.proverbe:
        return 0xFFB7410E;   // Terre cuite / rouille
    }
  }
}

// Classe Entry : représente une entrée de l'encyclopédie.
// Chaque instance contient toutes les informations d'un dicton/citation/expression.
class Entry {
  final int id;              // Identifiant unique
  final Category category;  // Catégorie de l'entrée
  final String text;         // Le texte principal (le dicton, la citation, l'expression)
  final String meaning;      // Signification ou explication
  final String? origin;      // Origine géographique ou historique (optionnel)
  final String? region;      // Région de France (optionnel, surtout pour les dictons)
  final String? author;      // Auteur (optionnel, surtout pour les citations)
  final List<String> tags;   // Mots-clés pour la recherche

  // Constructeur : le mot-clé 'const' permet de créer des objets
  // immuables connus à la compilation (plus performant).
  const Entry({
    required this.id,
    required this.category,
    required this.text,
    required this.meaning,
    this.origin,
    this.region,
    this.author,
    required this.tags,
  });
}
