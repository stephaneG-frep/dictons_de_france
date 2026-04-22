// ============================================================
// Fichier : lib/main.dart
// Rôle    : Point d'entrée de l'application Flutter.
//           Configure le thème global et lance HomeScreen.
// ============================================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'services/favorites_service.dart';

// main() est async car on doit attendre le chargement des favoris
// avant d'afficher l'interface.
void main() async {
  // Nécessaire avant tout appel async dans main()
  WidgetsFlutterBinding.ensureInitialized();
  // Charge les favoris sauvegardés sur le téléphone
  await FavoritesService().load();
  runApp(const DictonsDeFranceApp());
}

// Widget racine de l'application (sans état, le thème ne change pas).
class DictonsDeFranceApp extends StatelessWidget {
  const DictonsDeFranceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Titre affiché dans le gestionnaire de tâches du téléphone
      title: 'Dictons de France',
      // Cache la bannière "DEBUG" en haut à droite
      debugShowCheckedModeBanner: false,

      // ── Thème global de l'application ──
      theme: ThemeData(
        // Active Material 3 (design moderne de Google)
        useMaterial3: true,

        // Palette de couleurs basée sur le bleu marine
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A3A5C),
          brightness: Brightness.light,
        ),

        // Police par défaut pour tout le texte de l'app
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),

        // Style par défaut des AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1A3A5C),
          foregroundColor: Colors.white,
          titleTextStyle: GoogleFonts.merriweather(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          elevation: 2,
        ),

        // Style par défaut des cartes
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // Couleur de fond des écrans
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),

      // HomeScreen est l'écran affiché au lancement
      home: const HomeScreen(),
    );
  }
}
