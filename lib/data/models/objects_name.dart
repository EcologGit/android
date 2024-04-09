import 'dart:convert';

ObjectsName objectsNameFromJson(String str) => ObjectsName.fromJson(json.decode(str));

String objectsNameToJson(ObjectsName data) => json.encode(data.toJson());

class ObjectsName {
  int count;
  dynamic next;
  dynamic previous;
  List<Object> objects;

  ObjectsName({
    required this.count,
    required this.next,
    required this.previous,
    required this.objects,
  });

  factory ObjectsName.fromJson(Map<String, dynamic> json) => ObjectsName(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        objects: List<Object>.from(json["results"].map((x) => Object.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(objects.map((x) => x.toJson())),
      };
}

class Object {
  int pk;
  String name;

  Object({
    required this.pk,
    required this.name,
  });

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        pk: json["pk"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "name": name,
      };
}
