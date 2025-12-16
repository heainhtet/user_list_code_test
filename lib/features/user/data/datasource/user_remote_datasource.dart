import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../flavor_config.dart';
import '../model/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  UserRemoteDataSourceImpl({required this.client})
    : baseUrl = FlavorConfig.instance.values.baseUrl;

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await client
          .get(
            Uri.parse('$baseUrl/users'),
            headers: {
              'User-Agent': 'Mozilla/5.0 (Flutter App)',
              'Accept': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => UserModel.fromJson(e)).toList();
      } else if (response.statusCode == 403) {
        throw Exception('Access denied (403 Forbidden)');
      } else if (response.statusCode == 404) {
        throw Exception('Resource not found (404)');
      } else {
        throw Exception('Server error (${response.statusCode})');
      }
    } on SocketException {
      throw Exception('No internet connection or server is unreachable.');
    } on HttpException {
      throw Exception('HTTP error occurred.');
    } on http.ClientException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on TimeoutException {
      throw Exception('Connection timeout. Please try again.');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
