// presentation/providers/user_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../data/datasource/user_remote_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/get_users.dart';
import '../../domain/entities/user.dart';
import 'package:http/http.dart' as http;

final httpClientProvider = Provider<http.Client>((ref) => http.Client());

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  final client = ref.read(httpClientProvider);
  return UserRemoteDataSourceImpl(client: client);
});

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  final remoteDataSource = ref.read(userRemoteDataSourceProvider);
  return UserRepositoryImpl(remoteDataSource: remoteDataSource);
});

final getUsersUseCaseProvider = Provider<GetUsers>((ref) {
  final repository = ref.read(userRepositoryProvider);
  return GetUsers(repository);
});

final userListProvider = FutureProvider<List<User>>((ref) async {
  final getUsers = ref.read(getUsersUseCaseProvider);
  return getUsers();
});

final userSearchQueryProvider = StateProvider<String>((ref) => '');
