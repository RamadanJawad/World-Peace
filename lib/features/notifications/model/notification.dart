class Notifications {
  int? currentPage;
  List<ObjectData>? data;
  String? path;

  Notifications({
    this.currentPage,
    this.data,
    this.path,
  });

  Notifications.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ObjectData>[];
      json['data'].forEach((v) {
        data!.add(ObjectData.fromJson(v));
      });
    }
    path = json['path'];
  }
}

class ObjectData {
  String? id;
  int? notifiableId;
  Data? data;
  String? readAt;

  ObjectData({
    this.id,
    this.notifiableId,
    this.data,
    this.readAt,
  });

  ObjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    readAt = json['read_at'];
  }
}

class Data {
  String? title;
  String? body;
  int? userId;
  String? action;
  String? image;

  Data({this.title, this.body, this.userId, this.action, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    userId = json['user_id'];
    action = json['action'];
    image = json['image'];
  }
}
