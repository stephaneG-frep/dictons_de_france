import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/entry.dart';

class CustomEntriesService extends ChangeNotifier {
  static final CustomEntriesService _instance = CustomEntriesService._internal();
  factory CustomEntriesService() => _instance;
  CustomEntriesService._internal();

  static const String _key = 'custom_entries';
  List<Entry> _entries = [];

  List<Entry> get entries => List.unmodifiable(_entries);

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    if (stored != null) {
      final list = jsonDecode(stored) as List;
      _entries = list.map((e) => _fromJson(e as Map<String, dynamic>)).toList();
    }
    notifyListeners();
  }

  Future<void> add(Entry entry) async {
    _entries.insert(0, entry);
    await _save();
    notifyListeners();
  }

  Future<void> delete(int id) async {
    _entries.removeWhere((e) => e.id == id);
    await _save();
    notifyListeners();
  }

  int get nextId {
    if (_entries.isEmpty) return -1;
    return _entries.map((e) => e.id).reduce(min) - 1;
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(_entries.map(_toJson).toList()));
  }

  Map<String, dynamic> _toJson(Entry e) => {
    'id': e.id,
    'category': e.category.name,
    'text': e.text,
    'meaning': e.meaning,
    'origin': e.origin,
    'region': e.region,
    'author': e.author,
    'tags': e.tags,
  };

  Entry _fromJson(Map<String, dynamic> json) => Entry(
    id: json['id'] as int,
    category: Category.values.firstWhere((c) => c.name == json['category']),
    text: json['text'] as String,
    meaning: json['meaning'] as String,
    origin: json['origin'] as String?,
    region: json['region'] as String?,
    author: json['author'] as String?,
    tags: List<String>.from(json['tags'] as List),
  );
}
