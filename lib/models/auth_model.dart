class UserModel {
  int id;
  String name;
  String email;
  String gender;
  String phone;
  String department;
  String position;
  String token;

  UserModel({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.gender = '',
    this.phone = '',
    this.department = '',
    this.position = '',
    this.token = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      department: json['department'] ?? '',
      position: json['position'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
