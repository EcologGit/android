import 'dart:convert';

EventDetail eventDetailFromJson(String str) => EventDetail.fromJson(json.decode(str));

String eventDetailToJson(EventDetail data) => json.encode(data.toJson());

class EventDetail {
  int pk;
  String? name;
  DateTime? timeStart;
  DateTime? timeOfClose;
  StatusId statusId;
  String? photo;
  String? description;
  String? adress;
  List<NatureObject> natureObjects;
  List<dynamic> routes;
  bool isFavorite;

  EventDetail({
    required this.pk,
    required this.name,
    required this.timeStart,
    required this.timeOfClose,
    required this.statusId,
    required this.photo,
    required this.description,
    required this.adress,
    required this.natureObjects,
    required this.routes,
    required this.isFavorite,
  });

  factory EventDetail.fromJson(Map<String, dynamic> json) => EventDetail(
        pk: json["pk"],
        name: json["name"],
        timeStart: json["time_start"] == null ? null : DateTime.parse(json["time_start"]),
        timeOfClose: json["time_of_close"] == null ? null : DateTime.parse(json["time_of_close"]),
        statusId: StatusId.fromJson(json["status_id"]),
        photo: json["photo"],
        description: json["description"],
        adress: json["adress"],
        natureObjects: List<NatureObject>.from(json["nature_objects"].map((x) => NatureObject.fromJson(x))),
        routes: List<dynamic>.from(json["routes"].map((x) => x)),
        isFavorite: json["is_favorite"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "name": name,
        "time_start": timeStart?.toIso8601String(),
        "time_of_close": timeOfClose?.toIso8601String(),
        "status_id": statusId.toJson(),
        "photo": photo,
        "description": description,
        "adress": adress,
        "nature_objects": List<dynamic>.from(natureObjects.map((x) => x.toJson())),
        "routes": List<dynamic>.from(routes.map((x) => x)),
        "is_favorite": isFavorite,
      };
}

class NatureObject {
  String? name;
  String? locality;

  NatureObject({
    required this.name,
    required this.locality,
  });

  factory NatureObject.fromJson(Map<String, dynamic> json) => NatureObject(
        name: json["name"],
        locality: json["locality"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "locality": locality,
      };
}

class StatusId {
  String? name;

  StatusId({
    required this.name,
  });

  factory StatusId.fromJson(Map<String, dynamic> json) => StatusId(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
