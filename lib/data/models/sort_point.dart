import 'dart:convert';

SortPoints sortPointsFromJson(String str) => SortPoints.fromJson(json.decode(str));

String sortPointsToJson(SortPoints data) => json.encode(data.toJson());

class SortPoints {
  int count;
  dynamic next;
  dynamic previous;
  List<SortPoint> sortPoints;

  SortPoints({
    required this.count,
    required this.next,
    required this.previous,
    required this.sortPoints,
  });

  factory SortPoints.fromJson(Map<String, dynamic> json) => SortPoints(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        sortPoints: List<SortPoint>.from(json["results"].map((x) => SortPoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(sortPoints.map((x) => x.toJson())),
      };
}

class SortPoint {
  int pointId;
  String name;
  String locality;
  String schedule;
  String description;
  List<WastType> wastTypes;
  String photo;
  bool? isFavourite;

  SortPoint({
    required this.pointId,
    required this.name,
    required this.locality,
    required this.schedule,
    required this.description,
    required this.wastTypes,
    required this.photo,
    required this.isFavourite,
  });

  factory SortPoint.fromJson(Map<String, dynamic> json) => SortPoint(
        pointId: json["point_id"],
        name: json["name"],
        locality: json["locality"],
        schedule: json["schedule"],
        description: json["description"],
        wastTypes: List<WastType>.from(json["wast_types"].map((x) => WastType.fromJson(x))),
        photo: json["photo"],
        isFavourite: json["is_favourite"],
      );

  Map<String, dynamic> toJson() => {
        "point_id": pointId,
        "name": name,
        "locality": locality,
        "schedule": schedule,
        "description": description,
        "wast_types": List<dynamic>.from(wastTypes.map((x) => x.toJson())),
        "photo": photo,
        "is_favourite": isFavourite,
      };
}

class WastType {
  String name;

  WastType({
    required this.name,
  });

  factory WastType.fromJson(Map<String, dynamic> json) => WastType(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
