import 'dart:convert';

class Menu {

  Menu({
    required this.id,
    required this.name,
    required this.caption,
    required this.icon,
  });

  int id;
  String name;
  String caption;
  String icon;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["id"],
    name: json["name"],
    caption: json["caption"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "caption": caption,
    "icon": icon,
  };
}
