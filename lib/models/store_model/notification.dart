class NotificationModel {
  List<Notifications>? notifications;

  NotificationModel({this.notifications});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
  }
}

class Notifications{
  String? sId;
  String? text;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Notifications({this.sId, this.text, this.createdAt, this.updatedAt, this.iV});

  Notifications.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}