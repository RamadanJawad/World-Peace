class SearchOfUser {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? image;

  SearchOfUser({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.image,
  });

  SearchOfUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'];
  }
}
