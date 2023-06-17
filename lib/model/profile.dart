class Profile {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? mobile;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<Posts>? posts;

  Profile(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.mobile,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.posts});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }
}

class Posts {
  int? id;
  String? title;
  String? description;
  String? images;
  int? categoryId;
  String? adminId;
  int? userId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? createdAtFormatted;

  Posts(
      {this.id,
      this.title,
      this.description,
      this.images,
      this.categoryId,
      this.adminId,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdAtFormatted});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'];
    categoryId = json['category_id'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAtFormatted = json['created_at_formatted'];
  }
}