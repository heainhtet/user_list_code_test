class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Address address;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
  });
}

class Address {
  final String street;
  final String city;
  final String zipcode;

  Address({required this.street, required this.city, required this.zipcode});
}
