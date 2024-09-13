class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String department;
  final String faculty;
  final String position;
  String token;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.token,
    required this.gender,
    required this.department,
    required this.faculty,
    required this.position,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      department: json['department'] ?? '',
      faculty: json['faculty'] ?? '',
      position: json['position'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
