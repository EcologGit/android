import 'dart:convert';

ReportsOfObject reportsOfObjectFromJson(String str) => ReportsOfObject.fromJson(json.decode(str));

String reportsOfObjectToJson(ReportsOfObject data) => json.encode(data.toJson());

class ReportsOfObject {
  int count;
  dynamic next;
  dynamic previous;
  List<ReportsOfObjectResult> results;

  ReportsOfObject({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ReportsOfObject.fromJson(Map<String, dynamic> json) => ReportsOfObject(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<ReportsOfObjectResult>.from(json["results"].map((x) => ReportsOfObjectResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ReportsOfObjectResult {
  String description;
  DateTime createdAt;
  Rates rates;
  UserId userId;
  List<ResultResult> results;

  ReportsOfObjectResult({
    required this.description,
    required this.createdAt,
    required this.rates,
    required this.userId,
    required this.results,
  });

  factory ReportsOfObjectResult.fromJson(Map<String, dynamic> json) => ReportsOfObjectResult(
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        rates: Rates.fromJson(json["rates"]),
        userId: UserId.fromJson(json["user_id"]),
        results: List<ResultResult>.from(json["results"].map((x) => ResultResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "rates": rates.toJson(),
        "user_id": userId.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Rates {
  int? availability;
  int? beauty;
  int? purity;

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
  String? amount;
  int? wasteId;

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
  String? publicName;

  UserId({
    required this.publicName,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        publicName: json["public_name"],
      );

  Map<String, dynamic> toJson() => {
        "public_name": publicName,
      };
}
