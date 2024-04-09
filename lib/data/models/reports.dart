import 'dart:convert';

Reports reportsFromJson(String str) => Reports.fromJson(json.decode(str));

String reportsToJson(Reports data) => json.encode(data.toJson());

class Reports {
  int count;
  dynamic next;
  dynamic previous;
  List<Report> results;

  Reports({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Reports.fromJson(Map<String, dynamic> json) => Reports(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Report>.from(json["results"].map((x) => Report.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Report {
  String description;
  int pk;
  String? photo;
  DateTime createdAt;
  UserId userId;
  List<ResultResult> results;
  Obj obj;
  Rates rates;

  Report({
    required this.description,
    required this.pk,
    required this.photo,
    required this.createdAt,
    required this.userId,
    required this.results,
    required this.obj,
    required this.rates,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        description: json["description"],
        pk: json["pk"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
        userId: UserId.fromJson(json["user_id"]),
        results: List<ResultResult>.from(json["results"].map((x) => ResultResult.fromJson(x))),
        obj: Obj.fromJson(json["obj"]),
        rates: Rates.fromJson(json["rates"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "pk": pk,
        "photo": photo,
        "created_at": createdAt.toIso8601String(),
        "user_id": userId.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "obj": obj.toJson(),
        "rates": rates.toJson(),
      };
}

class Obj {
  String name;
  String? locality;
  String? typeObj;
  String? sortPoint;

  Obj({
    required this.name,
    required this.locality,
    required this.typeObj,
    required this.sortPoint,
  });

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
        name: json["name"],
        locality: json["locality"],
        typeObj: json["type_obj"],
        sortPoint: json["sort_point"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "locality": locality,
        "type_obj": typeObj,
        "sort_point": sortPoint,
      };
}

class Rates {
  int availability;
  int beauty;
  int purity;

  Rates({
    required this.availability,
    required this.beauty,
    required this.purity,
  });

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        availability: json["availability"],
        beauty: json["beauty"],
        purity: json["purity"],
      );

  Map<String, dynamic> toJson() => {
        "availability": availability,
        "beauty": beauty,
        "purity": purity,
      };
}

class ResultResult {
  String amount;
  int wasteId;

  ResultResult({
    required this.amount,
    required this.wasteId,
  });

  factory ResultResult.fromJson(Map<String, dynamic> json) => ResultResult(
        amount: json["amount"],
        wasteId: json["waste_id"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "waste_id": wasteId,
      };
}

class UserId {
  String username;
  String publicName;
  int pk;

  UserId({
    required this.username,
    required this.publicName,
    required this.pk,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        username: json["username"],
        publicName: json["public_name"],
        pk: json["pk"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "public_name": publicName,
        "pk": pk,
      };
}
