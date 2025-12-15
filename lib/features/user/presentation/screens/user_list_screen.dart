// presentation/screens/user_list_screen.dart
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
        iconTheme: const IconThemeData(
          color: Color(0xFF1A3D63), // menu icon color
        ),
        centerTitle: true,
        title: const Text(
          'User List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A3D63),
          ),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dark Mode",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A7FA7),
                ),
              ),
              Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (value) {
                  ref
                      .read(themeModeProvider.notifier)
                      .setTheme(value ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            spacing: 20,
            children: [
              TextField(
                cursorColor: Color(0xFF4A7FA7),

                decoration: InputDecoration(
                  labelText: 'Search by name',

                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(Icons.search_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1A3D63), width: 2),
                    borderRadius: BorderRadius.circular(80),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1A3D63), width: 2),
                    borderRadius: BorderRadius.circular(80),
                  ),
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
                        ref.refresh(userListProvider);
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
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
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
