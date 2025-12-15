import 'package:flutter/material.dart';
import 'flavor_config.dart';
import 'main.dart';

void main() {
  FlavorConfig.init(
    flavor: Flavor.prod,
    name: 'PROD',
    values: const FlavorValues(baseUrl: 'https://api.example.com'),
  );
  runApp(CodeTest());
}
