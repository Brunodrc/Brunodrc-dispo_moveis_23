class Person {
  late String name;
  late String email;
  late String phone;
  late String avatar;

  Person(
      {required this.name,
      required this.email,
      required this.phone,
      required this.avatar});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    return data;
  }
}
