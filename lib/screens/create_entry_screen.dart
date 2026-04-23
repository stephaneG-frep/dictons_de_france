import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/entry.dart';
import '../services/custom_entries_service.dart';

class CreateEntryScreen extends StatefulWidget {
  const CreateEntryScreen({super.key});

  @override
  State<CreateEntryScreen> createState() => _CreateEntryScreenState();
}

class _CreateEntryScreenState extends State<CreateEntryScreen> {
  final _formKey = GlobalKey<FormState>();

  Category _category = Category.dicton;
  final _textController = TextEditingController();
  final _meaningController = TextEditingController();
  final _authorController = TextEditingController();
  final _regionController = TextEditingController();
  final _tagsController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    _meaningController.dispose();
    _authorController.dispose();
    _regionController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final tags = _tagsController.text
        .split(',')
        .map((t) => t.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    final entry = Entry(
      id: CustomEntriesService().nextId,
      category: _category,
      text: _textController.text.trim(),
      meaning: _meaningController.text.trim(),
      author: _authorController.text.trim().isEmpty ? null : _authorController.text.trim(),
      region: _regionController.text.trim().isEmpty ? null : _regionController.text.trim(),
      tags: tags,
    );

    await CustomEntriesService().add(entry);
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nouvelle création',
          style: GoogleFonts.merriweather(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          TextButton(
            onPressed: _save,
            child: Text(
              'Enregistrer',
              style: TextStyle(
                color: colors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Catégorie
            Text('Catégorie', style: _labelStyle(context)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: Category.values.map((cat) {
                final selected = _category == cat;
                return ChoiceChip(
                  label: Text('${cat.emoji}  ${cat.displayName}'),
                  selected: selected,
                  onSelected: (_) => setState(() => _category = cat),
                  selectedColor: Color(cat.colorValue).withValues(alpha: 0.2),
                  checkmarkColor: Color(cat.colorValue),
                  labelStyle: TextStyle(
                    fontWeight: selected ? FontWeight.w700 : FontWeight.normal,
                    color: selected ? Color(cat.colorValue) : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Texte principal
            Text('Texte *', style: _labelStyle(context)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _textController,
              maxLines: 3,
              decoration: _inputDeco(context, 'Le dicton, la citation ou l\'expression…'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
            ),
            const SizedBox(height: 20),

            // Signification
            Text('Signification *', style: _labelStyle(context)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _meaningController,
              maxLines: 4,
              decoration: _inputDeco(context, 'Explication, interprétation…'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
            ),
            const SizedBox(height: 20),

            // Auteur (optionnel)
            Text('Auteur (optionnel)', style: _labelStyle(context)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _authorController,
              decoration: _inputDeco(context, 'Ex : Victor Hugo, Grand-mère…'),
            ),
            const SizedBox(height: 20),

            // Région (optionnel)
            Text('Région (optionnel)', style: _labelStyle(context)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _regionController,
              decoration: _inputDeco(context, 'Ex : Bretagne, Alsace…'),
            ),
            const SizedBox(height: 20),

            // Tags
            Text('Mots-clés (optionnel)', style: _labelStyle(context)),
            const SizedBox(height: 4),
            Text(
              'Séparés par des virgules',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _tagsController,
              decoration: _inputDeco(context, 'Ex : famille, sagesse, nature'),
            ),
            const SizedBox(height: 32),

            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.check_rounded),
              label: const Text('Enregistrer'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _labelStyle(BuildContext context) => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Theme.of(context).colorScheme.onSurface,
  );

  InputDecoration _inputDeco(BuildContext context, String hint) => InputDecoration(
    hintText: hint,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
  );
}
