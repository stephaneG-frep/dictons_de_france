// ============================================================
// Fichier : lib/screens/quiz_screen.dart
// Rôle    : Mode quiz — l'utilisateur devine la signification
//           d'une entrée. Appuyer retourne la carte pour révéler
//           la réponse. Score en session.
// ============================================================

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/entries_data.dart';
import '../models/entry.dart';

class QuizScreen extends StatefulWidget {
  // Catégorie filtrée (null = toutes)
  final Category? initialCategory;

  const QuizScreen({super.key, this.initialCategory});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  // Contrôleur pour l'animation de retournement de carte
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  // Catégorie sélectionnée (null = toutes)
  Category? _selectedCategory;
  // Entrée actuellement affichée
  late Entry _currentEntry;
  // La carte est-elle retournée (signification visible) ?
  bool _isFlipped = false;
  // Score de la session
  int _correct = 0;
  int _total = 0;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;

    // Animation de 0° à 180° (retournement de carte)
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );

    _pickNewEntry();
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  // Sélectionne une entrée aléatoire de la catégorie choisie
  void _pickNewEntry() {
    final pool = _selectedCategory == null
        ? allEntries
        : allEntries.where((e) => e.category == _selectedCategory).toList();
    if (pool.isEmpty) return;
    setState(() {
      _currentEntry = pool[Random().nextInt(pool.length)];
      _isFlipped = false;
    });
    _flipController.reset();
  }

  // Retourne la carte pour révéler la signification
  void _flip() {
    if (_isFlipped) return;
    setState(() => _isFlipped = true);
    _flipController.forward();
  }

  // L'utilisateur indique s'il connaissait la réponse
  void _answer(bool knew) {
    setState(() {
      _total++;
      if (knew) _correct++;
    });
    _pickNewEntry();
  }

  @override
  Widget build(BuildContext context) {
    final categoryColor = Color(_currentEntry.category.colorValue);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A3A5C),
        foregroundColor: Colors.white,
        title: Text(
          'Quiz',
          style: GoogleFonts.merriweather(fontSize: 16, color: Colors.white),
        ),
        // Score affiché dans l'AppBar
        actions: [
          if (_total > 0)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '$_correct / $_total',
                  style: const TextStyle(
                    color: Color(0xFFD4AF37),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),

      body: Column(
        children: [
          // ── Sélecteur de catégorie ──
          _buildCategorySelector(),

          const SizedBox(height: 12),

          // ── Carte retournable ──
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: _flip,
                child: AnimatedBuilder(
                  animation: _flipAnimation,
                  builder: (context, child) {
                    // Retournement 3D : première moitié = face avant, deuxième = face arrière
                    final angle = _flipAnimation.value * pi;
                    final showBack = angle > pi / 2;

                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      child: showBack
                          // ── Face arrière : signification ──
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(pi),
                              child: _buildCardBack(categoryColor),
                            )
                          // ── Face avant : texte de l'entrée ──
                          : _buildCardFront(categoryColor),
                    );
                  },
                ),
              ),
            ),
          ),

          // ── Boutons de réponse (visibles après retournement) ──
          AnimatedOpacity(
            opacity: _isFlipped ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: _buildAnswerButtons(),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Sélecteur de catégorie sous forme de chips défilables
  Widget _buildCategorySelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          // Chip "Toutes"
          _buildChip(null, 'Toutes', '🎲'),
          ...Category.values.map(
            (cat) => _buildChip(cat, cat.displayName, cat.emoji),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(Category? category, String label, String emoji) {
    final isSelected = _selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        selected: isSelected,
        label: Text('$emoji $label'),
        onSelected: (_) {
          setState(() => _selectedCategory = category);
          _pickNewEntry();
        },
        selectedColor: const Color(0xFF1A3A5C).withValues(alpha: 0.15),
        checkmarkColor: const Color(0xFF1A3A5C),
        labelStyle: TextStyle(
          color: isSelected ? const Color(0xFF1A3A5C) : Colors.grey.shade700,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
          fontSize: 13,
        ),
      ),
    );
  }

  // Face avant de la carte : affiche le texte
  Widget _buildCardFront(Color categoryColor) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: categoryColor.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: categoryColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_currentEntry.category.emoji,
              style: const TextStyle(fontSize: 52)),
          const SizedBox(height: 8),
          Text(
            _currentEntry.category.displayName.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: categoryColor,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '« ${_currentEntry.text} »',
            style: GoogleFonts.merriweather(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A3A5C),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.touch_app_outlined,
                  color: Colors.grey.shade400, size: 18),
              const SizedBox(width: 6),
              Text(
                'Appuyez pour révéler',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Face arrière de la carte : affiche la signification
  Widget _buildCardBack(Color categoryColor) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            categoryColor,
            categoryColor.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: categoryColor.withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lightbulb_outline, color: Colors.white70, size: 36),
          const SizedBox(height: 20),
          Text(
            'Signification',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _currentEntry.meaning,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          if (_currentEntry.author != null || _currentEntry.origin != null) ...[
            const SizedBox(height: 20),
            Text(
              _currentEntry.author ?? _currentEntry.origin ?? '',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  // Boutons "Je savais" / "Je ne savais pas"
  Widget _buildAnswerButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _answer(false),
              icon: const Icon(Icons.close, color: Colors.redAccent),
              label: const Text('Je ne savais pas',
                  style: TextStyle(color: Colors.redAccent)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.redAccent),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => _answer(true),
              icon: const Icon(Icons.check, color: Colors.white),
              label: const Text('Je savais !',
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
