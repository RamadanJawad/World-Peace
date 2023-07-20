class Profile {
  int? friend;
  int? followingCount;
  int? followerCount;
  User? user;
  List<Posts>? posts;

  Profile(
      {this.friend,
      this.followingCount,
      this.followerCount,
      this.user,
      this.posts});

  Profile.fromJson(Map<String, dynamic> json) {
    friend = json['friend'];
    followingCount = json['following_count'];
    followerCount = json['follower_count'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
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

class Posts {
  int? id;
  String? title;
  String? description;
  List<String>? images;
  int? status;
  int? commentsCount;
  int? likesCount;
  int? likesPost;
  String? createdAtFormatted;
  Category? category;
  User? user;

  Posts(
      {this.id,
      this.title,
      this.description,
      this.images,
      this.status,
      this.commentsCount,
      this.likesCount,
      this.likesPost,
      this.createdAtFormatted,
      this.category,
      this.user});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'].cast<String>();
    status = json['status'];
    commentsCount = json['comments_count'];
    likesCount = json['likes_count'];
    likesPost = json['likes_post'];
    createdAtFormatted = json['created_at_formatted'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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