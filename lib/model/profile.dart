class Profile {
  int? status;
  User? user;
  Posts? posts;
  bool? isFriend;

  Profile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    posts = json['posts'] != null ? Posts.fromJson(json['posts']) : null;
    isFriend = json['friend'];
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

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.mobile,
      this.image,
      this.createdAt,
      this.updatedAt});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
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

  Posts(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to});

  Posts.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    return data;
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

  Data(
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
      this.commentsCount,
      this.likesCount,
      this.createdAtFormatted,
      this.comments,
      this.admin,
      this.likes});

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
        comments!.add(new Comments.fromJson(v));
      });
    }
    admin = json['admin'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['images'] = this.images;
    data['category_id'] = this.categoryId;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['comments_count'] = this.commentsCount;
    data['likes_count'] = this.likesCount;
    data['created_at_formatted'] = this.createdAtFormatted;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['admin'] = this.admin;
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Comments(
      {this.id,
      this.description,
      this.postId,
      this.adminId,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdAtFormatted,
      this.user,
      this.admin});

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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['post_id'] = this.postId;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_at_formatted'] = this.createdAtFormatted;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['admin'] = this.admin;
    return data;
  }
}

class Likes {
  int? id;
  int? postId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Likes(
      {this.id,
      this.postId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
