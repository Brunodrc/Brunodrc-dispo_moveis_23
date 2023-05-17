class User {
  int? id;
  String username;
  String password;
  String? avatar;

  User({required this.username, required this.password, this.avatar, this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'username': this.username,
      'password': this.password,
    };
  }
}
