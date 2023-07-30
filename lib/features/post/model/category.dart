class Categories {
  int? id;
  String? name;
  String? description;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
