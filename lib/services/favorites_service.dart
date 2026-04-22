// ============================================================
// Fichier : lib/services/favorites_service.dart
// Rôle    : Gère la persistance des entrées favorites.
//           Utilise SharedPreferences pour sauvegarder les IDs
//           sur le téléphone, même après fermeture de l'app.
// ============================================================

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// FavoritesService étend ChangeNotifier :
// quand les favoris changent, tous les widgets abonnés se reconstruisent.
// C'est un singleton : une seule instance existe dans toute l'app.
class FavoritesService extends ChangeNotifier {
  // Instance unique (pattern Singleton)
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  // Clé utilisée pour stocker les IDs dans SharedPreferences
  static const String _storageKey = 'favorite_ids';

  // Ensemble des IDs favoris en mémoire
  Set<int> _favoriteIds = {};

  // Getter public : retourne une copie non modifiable
  Set<int> get favoriteIds => Set.unmodifiable(_favoriteIds);

  // Charge les favoris depuis le stockage au démarrage de l'app
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    // On lit la liste de strings et on la convertit en Set<int>
    final stored = prefs.getStringList(_storageKey) ?? [];
    _favoriteIds = stored.map(int.parse).toSet();
    notifyListeners();
  }

  // Vérifie si une entrée est dans les favoris
  bool isFavorite(int id) => _favoriteIds.contains(id);

  // Ajoute ou retire un favori, puis sauvegarde
  Future<void> toggle(int id) async {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    // Sauvegarde immédiate sur le téléphone
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _storageKey,
      _favoriteIds.map((e) => e.toString()).toList(),
    );
    // Notifie tous les widgets abonnés pour qu'ils se reconstruisent
    notifyListeners();
  }
}
