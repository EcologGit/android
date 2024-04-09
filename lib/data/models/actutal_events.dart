import 'dart:convert';

ActualEvents actualEventsFromJson(String str) => ActualEvents.fromJson(json.decode(str));

String actualEventsToJson(ActualEvents data) => json.encode(data.toJson());

class ActualEvents {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  ActualEvents({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ActualEvents.fromJson(Map<String, dynamic> json) => ActualEvents(
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
  String photo;
  String name;
  DateTime timeStart;
  int statusId;

  Result({
    required this.pk,
    required this.photo,
    required this.name,
    required this.timeStart,
    required this.statusId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pk: json["pk"],
        photo: json["photo"],
        name: json["name"],
        timeStart: DateTime.parse(json["time_start"]),
        statusId: json["status_id"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "photo": photo,
        "name": name,
        "time_start": timeStart.toIso8601String(),
        "status_id": statusId,
      };
}
