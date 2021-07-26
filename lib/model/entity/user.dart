class User {
  final String id;
  final Name name;
  final Name kanaName;
  final DateTime dateOfBirth;
  final Gender gender;
  final Address address;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.kanaName,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.email
  });
}

class Name {
  final String firstName;
  final String lastName;

  Name({ required this.firstName, required this.lastName });
}

class Address {
  final String postalCode;
  final String prefecture;
  final String city;
  final String street;
  final String? building;

  Address({
    required this.postalCode,
    required this.prefecture,
    required this.city,
    required this.street,
    this.building
  });
}

enum Gender {
  Male,
  Female
}