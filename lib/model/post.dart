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
  List<String>? images;
  int? categoryId;
  int? userId;
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
      this.images,
      this.categoryId,
      this.userId,
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
    images = json['images'].cast<String>();
    categoryId = json['category_id'];
    userId = json['user_id'];
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
  String? image;

  User({this.id, this.name, this.email, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }
}

class Likes {
  int? id;
  int? postId;
  int? userId;

  Likes({this.id, this.postId, this.userId});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    userId = json['user_id'];
  }
}
