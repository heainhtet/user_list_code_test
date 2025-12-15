import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/theme_mode_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User List')),
      body: SwitchListTile(
        title: const Text('Dark Mode'),
        value: themeMode == ThemeMode.dark,
        onChanged: (value) {
          ref
              .read(themeModeProvider.notifier)
              .setTheme(value ? ThemeMode.dark : ThemeMode.light);
        },
      ),
    );
  }
}
