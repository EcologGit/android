import 'dart:convert';

Routes routesFromJson(String str) => Routes.fromJson(json.decode(str));

String routesToJson(Routes data) => json.encode(data.toJson());

class Routes {
  int count;
  dynamic next;
  dynamic previous;
  List<Route> routes;

  Routes({
    required this.count,
    required this.next,
    required this.previous,
    required this.routes,
  });

  factory Routes.fromJson(Map<String, dynamic> json) => Routes(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        routes: List<Route>.from(json["results"].map((x) => Route.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(routes.map((x) => x.toJson())),
      };
}

class Route {
  int routeId;
  String name;
  String locality;
  double length;
  String duration;
  double? avgAvailability;
  double? avgBeauty;
  double? avgPurity;
  bool? isFavourite;
  String photo;

  Route({
    required this.routeId,
    required this.name,
    required this.locality,
    required this.length,
    required this.duration,
    required this.avgAvailability,
    required this.avgBeauty,
    required this.avgPurity,
    required this.photo,
    required this.isFavourite,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        routeId: json["route_id"],
        name: json["name"],
        locality: json["locality"],
        length: json["length"],
        duration: json["duration"],
        avgAvailability: json["avg_availability"],
        avgBeauty: json["avg_beauty"],
        avgPurity: json["avg_purity"],
        photo: json["photo"],
        isFavourite: json["is_favourite"],
      );

  Map<String, dynamic> toJson() => {
        "route_id": routeId,
        "name": name,
        "locality": locality,
        "length": length,
        "duration": duration,
        "avg_availability": avgAvailability,
        "avg_beauty": avgBeauty,
        "avg_purity": avgPurity,
        "photo": photo,
        "is_favourite": isFavourite,
      };
}
