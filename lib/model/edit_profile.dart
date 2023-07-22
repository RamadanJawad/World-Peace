class EditProfileModel {
  String? name;
  String? imagePath;
  String? email;
  String? mobile;
  EditProfileModel({this.email, this.name, this.imagePath, this.mobile});
}

class EditProfileResponse {
  User? user;
  String? message;

  EditProfileResponse({this.user, this.message});

  EditProfileResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
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
