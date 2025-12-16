import 'package:ace_plus_code_test/core/theme/theme_mode_notifier.dart';
import 'package:ace_plus_code_test/features/user/presentation/screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp( ProviderScope(child: CodeTest()));
}

// class CodeTest extends ConsumerWidget {
//   const CodeTest({super.key});

//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     final themeMode = ref.watch(themeModeProvider);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: themeMode,
//       home: UserListScreen());
//   }
// }

class CodeTest extends ConsumerWidget {
  const CodeTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 690), // same as your example
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          home: UserListScreen(),
        );
      },
    );
  }
}
