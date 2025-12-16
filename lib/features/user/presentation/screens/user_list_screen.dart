import 'package:ace_plus_code_test/features/user/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme_mode_notifier.dart';
import '../providers/user_providers.dart';
import '../widgets/user_list_tile.dart';
import 'user_detail_screen.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsyncValue = ref.watch(userListProvider);
    final searchQuery = ref.watch(userSearchQueryProvider);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User List',
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
            spacing: 20,
            children: [
              TextField(
                cursorColor: Theme.of(context).colorScheme.primary,

                decoration: InputDecoration(
                  labelText: 'Search by name',

                  prefixIcon: Icon(Icons.search_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  enabled: true,
                ),

                onChanged: (value) =>
                    ref.read(userSearchQueryProvider.notifier).state = value,
              ),
              Expanded(
                child: usersAsyncValue.when(
                  data: (users) {
                    final filteredUsers = users.where((user) {
                      return user.name.toLowerCase().contains(
                        searchQuery.toLowerCase(),
                      );
                    }).toList();

                    return RefreshIndicator(
                      onRefresh: () async {
                        // ref.refresh(userListProvider.future);
                        await ref.read(userListProvider.notifier).refresh();
                      },
                      child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          return UsrListTile(
                            user: user,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UserDetailScreen(user: user),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                  loading: () => LoadingWidget(),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
