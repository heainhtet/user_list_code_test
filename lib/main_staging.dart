import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'flavor_config.dart';
import 'main.dart';

void main() {
  FlavorConfig.init(
    flavor: Flavor.staging,
    name: 'STAGING',
    values: const FlavorValues(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );
  runApp(ProviderScope(child: CodeTest()));
}
