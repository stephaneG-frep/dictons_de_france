// ============================================================
// Fichier : lib/main.dart
// Rôle    : Point d'entrée. Configure le thème clair/sombre
//           et initialise les services au démarrage.
// ============================================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'services/custom_entries_service.dart';
import 'services/favorites_service.dart';
import 'services/theme_service.dart';
import 'services/notification_service.dart';
import 'services/widget_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Chargement en parallèle des services persistants
  await Future.wait([
    FavoritesService().load(),
    CustomEntriesService().load(),
    ThemeService().load(),
    NotificationService.initialize(),
  ]);
  WidgetService.updateDailyDicton();
  runApp(const DictonsDeFranceApp());
}

class DictonsDeFranceApp extends StatelessWidget {
  const DictonsDeFranceApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ListenableBuilder reconstruit l'app quand le thème change
    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        return MaterialApp(
          title: 'Dictons de France',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeService().mode,
          theme: _buildLightTheme(),
          darkTheme: _buildDarkTheme(),
          home: const HomeScreen(),
        );
      },
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1A3A5C),
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.latoTextTheme(ThemeData(brightness: Brightness.light).textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1A3A5C),
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.merriweather(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F7FA),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1A3A5C),
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.latoTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0D1F33),
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.merriweather(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E2D3D),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      scaffoldBackgroundColor: const Color(0xFF111E2A),
    );
  }
}
