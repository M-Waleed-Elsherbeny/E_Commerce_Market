class UserDataModel {
  String user_id, name, email;
  UserDataModel({
    required this.user_id,
    required this.name,
    required this.email,
  });

  factory UserDataModel.fromJson(List<Map<String, dynamic>> json) {
    return UserDataModel(
      user_id: json[0]['user_id'],
      name: json[0]['name'],
      email: json[0]['email'],
    );
  }
}
