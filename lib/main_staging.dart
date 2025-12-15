import 'package:flutter/material.dart';
import 'flavor_config.dart';
import 'main.dart';

void main() {
  FlavorConfig.init(
    flavor: Flavor.staging,
    name: 'STAGING',
    values: const FlavorValues(baseUrl: 'https://api-staging.example.com'),
  );
  runApp(CodeTest());
}
