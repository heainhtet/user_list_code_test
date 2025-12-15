import 'package:ace_plus_code_test/core/theme/theme_mode_notifier.dart';
import 'package:ace_plus_code_test/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp( ProviderScope(child: CodeTest()));
}

class CodeTest extends ConsumerWidget {
  const CodeTest({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: HomePage());
  }
}
