import 'dart:convert';

class Events {
  int count;
  dynamic next;
  dynamic previous;
  List<Event> events;

  Events({
    required this.count,
    required this.next,
    required this.previous,
    required this.events,
  });

  factory Events.fromRawJson(String str) => Events.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        events: List<Event>.from(json["results"].map((event) => Event.fromJson(event))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  String name;
  String photo;
  String description;
  int eventId;
  DateTime datetimeStart;
  String status;
  String adress;
  dynamic isFavourite;

  Event({
    required this.name,
    required this.photo,
    required this.description,
    required this.eventId,
    required this.datetimeStart,
    required this.status,
    required this.adress,
    required this.isFavourite,
  });

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        name: json["name"],
        photo: json["photo"],
        description: json["description"],
        eventId: json["event_id"],
        datetimeStart: DateTime.parse(json["datetime_start"]),
        status: json["status"],
        adress: json["adress"],
        isFavourite: json["is_favourite"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
        "description": description,
        "event_id": eventId,
        "datetime_start": datetimeStart.toIso8601String(),
        "status": status,
        "adress": adress,
        "is_favourite": isFavourite,
      };
}
