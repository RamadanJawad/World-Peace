class Profile {
  int? status;
  User? user;
  Posts? posts;
  int? friend;

  Profile({this.status, this.user, this.posts, this.friend});

  Profile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    posts = json['posts'] != null ? Posts.fromJson(json['posts']) : null;
    friend = json['friend'];
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

class Posts {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;

  Posts.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
  }
}

class Data {
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
  int? commentsCount;
  int? likesCount;
  String? createdAtFormatted;
  List<Comments>? comments;
  Null? admin;
  List<Likes>? likes;

  Data.fromJson(Map<String, dynamic> json) {
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
    likesCount = json['likes_count'];
    createdAtFormatted = json['created_at_formatted'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    admin = json['admin'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
  }
}

class Comments {
  int? id;
  String? description;
  int? postId;
  Null? adminId;
  int? userId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? createdAtFormatted;
  User? user;
  Null? admin;

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    postId = json['post_id'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAtFormatted = json['created_at_formatted'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    admin = json['admin'];
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}
