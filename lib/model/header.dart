class Header {
  String actionUrl;
  String description;
  bool expert;
  String icon;
  String iconType;
  int id;
  bool ifPgc;
  bool ifShowNotificationIcon;
  String title;
  int uid;

  Header(
      {required this.actionUrl,
        required this.description,
        required this.expert,
        required this.icon,
        required this.iconType,
        required this.id,
        required this.ifPgc,
        required this.ifShowNotificationIcon,
        required this.title,
        required this.uid});

  Header.fromJson(Map<String, dynamic> json)
      : actionUrl = json['actionUrl'] ?? '',
        description = json['description'] ?? '',
        expert = json['expert'] ?? false,
        icon = json['icon'] ?? '',
        iconType = json['iconType'] ?? '',
        id = json['id'] ?? 0,
        ifPgc = json['ifPgc'] ?? false,
        ifShowNotificationIcon = json['ifShowNotificationIcon'] ?? false,
        title = json['title'] ?? '',
        uid = json['uid'] ?? 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['actionUrl'] = actionUrl;
    data['description'] = description;
    data['expert'] = expert;
    data['icon'] = icon;
    data['iconType'] = iconType;
    data['id'] = id;
    data['ifPgc'] = ifPgc;
    data['ifShowNotificationIcon'] = ifShowNotificationIcon;
    data['title'] = title;
    data['uid'] = uid;
    return data;
  }
}