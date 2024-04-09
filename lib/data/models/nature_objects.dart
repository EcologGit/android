import 'dart:convert';

NatureObjects natureObjectsFromJson(String str) => NatureObjects.fromJson(json.decode(str));

String natureObjectsToJson(NatureObjects data) => json.encode(data.toJson());

class NatureObjects {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  NatureObjects({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory NatureObjects.fromJson(Map<String, dynamic> json) => NatureObjects(
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
  String locality;
  String photo;

  Result({
    required this.pk,
    required this.name,
    required this.locality,
    required this.photo,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pk: json["pk"],
        name: json["name"],
        locality: json["locality"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "name": name,
        "locality": locality,
        "photo": photo,
      };
}
