// data/datasource/user_remote_datasource.dart
import 'dart:convert';
import 'package:flutter/material.dart';
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
    final response = await client.get(
      Uri.parse('$baseUrl/users'),
      headers: {
        // mimic browser User-Agent to prevent access denied 
        'User-Agent': 'Mozilla/5.0 (Flutter App)', 
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      return data.map((json) => UserModel.fromJson(json)).toList();
    } else if (response.statusCode == 403) {
      // Handle Forbidden error
      throw Exception(
        'Access denied (403 Forbidden). You don\'t have permission to access this resource.',
      );
    } else if (response.statusCode == 404) {
      // Handle Not Found
      throw Exception('Resource not found (404).');
    } else {
      throw Exception('Failed to load users');
    }
  }
}
