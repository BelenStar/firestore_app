class UserLog {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final int age;

  UserLog(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.age});

  factory UserLog.fromJson(Map<String, dynamic> json, String id) {
    return UserLog(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      age: json['age'],
      id: id,
    );
  }
}
