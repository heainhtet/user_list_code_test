enum Flavor { dev, staging, prod }

class FlavorValues {
  final String baseUrl;
  const FlavorValues({required this.baseUrl});
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig? _instance;

  FlavorConfig._internal({
    required this.flavor,
    required this.name,
    required this.values,
  }) {
    _instance = this;
  }

  static void init({
    required Flavor flavor,
    required String name,
    required FlavorValues values,
  }) {
    FlavorConfig._internal(flavor: flavor, name: name, values: values);
  }

  static FlavorConfig get instance {
    assert(_instance != null, 'FlavorConfig not initialized');
    return _instance!;
  }

  bool isProduction() => flavor == Flavor.prod;
}
