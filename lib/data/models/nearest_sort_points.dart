import 'dart:convert';

NearestSortPoints nearestSortPointsFromJson(String str) => NearestSortPoints.fromJson(json.decode(str));

String nearestSortPointsToJson(NearestSortPoints data) => json.encode(data.toJson());

class NearestSortPoints {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  NearestSortPoints({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory NearestSortPoints.fromJson(Map<String, dynamic> json) => NearestSortPoints(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  int pk;
  String name;
  String schedule;
  String photo;
  String adress;

  Result({
    required this.pk,
    required this.name,
    required this.schedule,
    required this.photo,
    required this.adress,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pk: json["pk"],
        name: json["name"],
        schedule: json["schedule"],
        photo: json["photo"],
        adress: json["adress"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "name": name,
        "schedule": schedule,
        "photo": photo,
        "adress": adress,
      };
}
