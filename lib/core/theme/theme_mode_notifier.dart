import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_local_storage.dart';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  late final ThemeLocalStorage _storage;

  @override
  ThemeMode build() {
    _storage = ThemeLocalStorage();

    // Load saved theme asynchronously
    _loadTheme();

    // Default value before load completes
    return ThemeMode.system;
  }

  Future<void> _loadTheme() async {
    final mode = await _storage.loadTheme();
    state = mode;
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    await _storage.saveTheme(mode);
  }
}
