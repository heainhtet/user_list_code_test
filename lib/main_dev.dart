import 'package:flutter/material.dart';
import 'flavor_config.dart';
import 'main.dart';

void main() {
  FlavorConfig.init(
    flavor: Flavor.dev,
    name: 'DEV',
    values: const FlavorValues(baseUrl: 'https://api-dev.example.com'),
  );
  runApp(CodeTest());
}
