// ============================================================
// Fichier : lib/services/notification_service.dart
// Rôle    : Gère les notifications locales quotidiennes.
//           Envoie chaque matin l'entrée du jour.
// ============================================================

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import '../data/entries_data.dart';
import '../models/entry.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static bool _initialized = false;

  // Initialise le service au démarrage de l'app
  static Future<void> initialize() async {
    if (_initialized) return;

    // Initialise les fuseaux horaires (nécessaire pour planifier)
    tz.initializeTimeZones();

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: androidSettings);

    await _plugin.initialize(settings);
    _initialized = true;
  }

  // Demande la permission de notifications (Android 13+)
  static Future<bool> requestPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final granted = await android?.requestNotificationsPermission();
    return granted ?? false;
  }

  // Planifie une notification quotidienne à l'heure donnée (défaut 8h00)
  static Future<void> scheduleDailyNotification({
    int hour = 8,
    int minute = 0,
  }) async {
    await _plugin.cancelAll();

    // Calcule l'entrée du jour
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    final entry = allEntries[dayOfYear % allEntries.length];

    // Prépare la prochaine occurrence de l'heure cible
    final location = tz.local;
    var scheduledDate = tz.TZDateTime(
      location,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    // Si l'heure est déjà passée aujourd'hui, on programme pour demain
    if (scheduledDate.isBefore(tz.TZDateTime.now(location))) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    const androidDetails = AndroidNotificationDetails(
      'dictons_daily',
      'Entrée du jour',
      channelDescription: 'Reçois chaque matin un dicton, proverbe ou citation.',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      icon: '@mipmap/ic_launcher',
    );

    await _plugin.zonedSchedule(
      0,
      '${entry.category.emoji} Entrée du jour',
      '« ${entry.text} »',
      scheduledDate,
      const NotificationDetails(android: androidDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  // Annule toutes les notifications planifiées
  static Future<void> cancelAll() => _plugin.cancelAll();
}
