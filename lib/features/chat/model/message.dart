class Message {
  Data? data;
  int? dataCount;
  String? receivedId;
  UserData? userData;

  Message({this.data, this.dataCount, this.receivedId, this.userData});

  Message.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    dataCount = json['data_count'];
    receivedId = json['received_id'];
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }
}

class Data {
  int? currentPage;
  List<DataMessage>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  int? prevPageUrl;
  int? to;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataMessage>[];
      json['data'].forEach((v) {
        data!.add(DataMessage.fromJson(v));
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

class DataMessage {
  int? id;
  int? senderId;
  int? receivedId;
  String? message;
  String? image;
  String? readAt;
  String? createdAt;
  String? updatedAt;
  String? createdAtFormatted;

  DataMessage(
      {this.id,
      this.senderId,
      this.receivedId,
      this.message,
      this.image,
      this.readAt,
      this.createdAt,
      this.updatedAt,
      this.createdAtFormatted});

  DataMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receivedId = json['received_id'];
    message = json['message'];
    image = json['image'];
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAtFormatted = json['created_at_formatted'];
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? mobile;
  String? image;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.mobile,
      this.image,
      this.createdAt,
      this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
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
