class UserChat {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? lastChat;

  UserChat(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.lastChat});

  UserChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastChat = json['last_chat'];
  }
}
