import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dictons_de_france/main.dart';
import 'package:dictons_de_france/data/entries_data.dart';
import 'package:dictons_de_france/models/entry.dart';
import 'package:dictons_de_france/services/favorites_service.dart';

void main() {
  // Initialise SharedPreferences avec des valeurs vides avant les tests
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('L\'app démarre et affiche le titre', (WidgetTester tester) async {
    await FavoritesService().load();
    await tester.pumpWidget(const DictonsDeFranceApp());
    await tester.pumpAndSettle();

    expect(find.text('Dictons de France'), findsOneWidget);
  });

  testWidgets('Les 5 onglets sont affichés', (WidgetTester tester) async {
    await FavoritesService().load();
    await tester.pumpWidget(const DictonsDeFranceApp());
    await tester.pumpAndSettle();

    expect(find.text('🌾  Dictons'), findsOneWidget);
    expect(find.text('📜  Citations'), findsOneWidget);
    expect(find.text('💬  Expressions'), findsOneWidget);
    expect(find.text('📖  Proverbes'), findsOneWidget);
    expect(find.text('❤️  Favoris'), findsOneWidget);
  });

  test('Les données contiennent des entrées dans chaque catégorie', () {
    for (final category in Category.values) {
      final entries = allEntries.where((e) => e.category == category).toList();
      expect(entries.length, greaterThan(0),
          reason: 'Aucune entrée pour la catégorie ${category.displayName}');
    }
  });

  test('Tous les IDs d\'entrées sont uniques', () {
    final ids = allEntries.map((e) => e.id).toList();
    final uniqueIds = ids.toSet();
    expect(ids.length, equals(uniqueIds.length),
        reason: 'Des IDs sont en double dans allEntries');
  });

  test('Le service Favoris ajoute et retire correctement', () async {
    await FavoritesService().load();
    const testId = 1;

    expect(FavoritesService().isFavorite(testId), isFalse);
    await FavoritesService().toggle(testId);
    expect(FavoritesService().isFavorite(testId), isTrue);
    await FavoritesService().toggle(testId);
    expect(FavoritesService().isFavorite(testId), isFalse);
  });
}
