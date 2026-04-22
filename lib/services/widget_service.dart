import 'package:home_widget/home_widget.dart';

import '../data/entries_data.dart';
import '../models/entry.dart';

class WidgetService {
  static Future<void> updateDailyDicton() async {
    try {
      final dictons = allEntries
          .where((e) => e.category == Category.dicton)
          .toList();
      if (dictons.isEmpty) return;

      final now = DateTime.now();
      final dayOfYear = now.difference(DateTime(now.year)).inDays;
      final entry = dictons[dayOfYear % dictons.length];

      const maxMeaningLength = 120;
      final meaning = entry.meaning.length > maxMeaningLength
          ? '${entry.meaning.substring(0, maxMeaningLength)}…'
          : entry.meaning;

      await HomeWidget.saveWidgetData<String>('dicton_text', entry.text);
      await HomeWidget.saveWidgetData<String>('dicton_meaning', meaning);
      await HomeWidget.updateWidget(androidName: 'DictonWidgetProvider');
    } catch (_) {
      // Le widget est optionnel — une erreur ici ne bloque pas l'app
    }
  }
}
