class Comments {
  int? status;
  Data? data;
  int? commentsCount;

  Comments({this.status, this.data, this.commentsCount});

  Comments.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    commentsCount = json['comments_count'];
  }
}

class Data {
  int? currentPage;
  List<Comment>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  int? perPage;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.perPage,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Comment>[];
      json['data'].forEach((v) {
        data!.add(Comment.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

class Comment {
  int? id;
  String? description;
  int? postId;
  int? userId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? createdAtFormatted;
  User? user;

  Comment(
      {this.id,
      this.description,
      this.postId,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdAtFormatted,
      this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    postId = json['post_id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAtFormatted = json['created_at_formatted'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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
