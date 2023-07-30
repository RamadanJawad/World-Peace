class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? mobile;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? token;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }
}
