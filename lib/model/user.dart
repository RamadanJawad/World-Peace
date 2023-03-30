class User {
  late int id;
  late String name;
  late String email;
  late String mobile;
  late String image;
  late String createdAt;
  late String updatedAt;
  late String token;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }
}