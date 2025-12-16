// presentation/screens/user_detail_screen.dart
import 'package:ace_plus_code_test/features/user/presentation/widgets/user_detail_contect_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme_mode_notifier.dart';
import '../../domain/entities/user.dart';
import '../widgets/user_address_card.dart';
import '../widgets/user_detail_user_name_card.dart';

class UserDetailScreen extends ConsumerWidget {
  final User user;

  const UserDetailScreen({required this.user, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          "User Detail",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              ref
                  .read(themeModeProvider.notifier)
                  .setTheme(
                    themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              UserDetailUserNameCard(user: user),
              UserDetailContectInfoCard(user: user),

              UserAddressCard(user: user),
            ],
          ),
        ),
      ),
    );
  }
}
