class Notification {
  int? currentPage;
  List<ObjectData>? objectData;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;

  Notification.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      objectData = <ObjectData>[];
      json['data'].forEach((v) {
        objectData!.add(ObjectData.fromJson(v));
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
}

class ObjectData {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  ObjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Data {
  String? title;
  String? body;
  String? action;
  String? image;

  Data({this.title, this.body, this.action, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    action = json['action'];
    image = json['image'];
  }
}
