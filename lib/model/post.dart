class ObjectPost {
  int? status;
  Data? data;

  ObjectPost.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<Post>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Post>[];
      json['data'].forEach((v) {
        data!.add(new Post.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class Post {
  int? id;
  String? title;
  String? description;
  String? images;
  int? categoryId;
  Null? adminId;
  int? userId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? createdAtFormatted;
  Category? category;
  User? user;
  int? commentsCount;
  Null? admin;
  List<Likes>? likes;

  Post.fromJson(Map<String, dynamic> json) {
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
    commentsCount = json['comments_count'];
    createdAtFormatted = json['created_at_formatted'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    admin = json['admin'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
  }
}

class Category {
  int? id;
  String? name;
  String? description;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Category();

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? mobile;
  String? image;
  String? createdAt;
  String? updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Likes {
  int? id;
  int? postId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
