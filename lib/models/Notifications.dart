class Notifications {
  int id;
  String notificationDescription;
  String notificationIcon;

  Notifications({
    this.id,
    this.notificationDescription,
    this.notificationIcon
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications( 
    id: json['id'],
    notificationDescription: json['notificationDescription'],
    notificationIcon: json['notificationIcon'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "notificationDescription": notificationDescription,
    "notificationIcon": notificationIcon,
  };
}
