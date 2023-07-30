class Following {
  int? id;
  int? authId;
  int? userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Data? data;

  Following(
      {this.id,
      this.authId,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.data});

  Following.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authId = json['auth_id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    data = json['user'] != null ? Data.fromJson(json['user']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? image;

  Data({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.image,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'];
  }
}
