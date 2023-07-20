class ObjectPost {
  List<Posts>? posts;

  ObjectPost({this.posts});

  ObjectPost.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }
}

class Posts {
  int? id;
  String? title;
  String? description;
  int? status;
  int? commentsCount;
  int? likesCount;
  int? likesPost;
  String? createdAtFormatted;
  Category? category;
  User? user;
  List<Likes>? likes;

  Posts(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.commentsCount,
      this.likesCount,
      this.likesPost,
      this.createdAtFormatted,
      this.category,
      this.user,
      this.likes});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    commentsCount = json['comments_count'];
    likesCount = json['likes_count'];
    likesPost = json['likes_post'];
    createdAtFormatted = json['created_at_formatted'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? image;

  User({this.id, this.name, this.email, this.mobile, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'];
  }
}

class Likes {
  int? id;
  int? postId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Likes({this.id, this.postId, this.userId, this.createdAt, this.updatedAt});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
