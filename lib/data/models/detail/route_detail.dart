import 'dart:convert';

RouteDetail routeDetailFromJson(String str) => RouteDetail.fromJson(json.decode(str));

String routeDetailToJson(RouteDetail data) => json.encode(data.toJson());

class RouteDetail {
  ObjectInfo objectInfo;
  bool isFavorite;
  List<ReportsStatistic> reportsStatistic;

  RouteDetail({
    required this.objectInfo,
    required this.isFavorite,
    required this.reportsStatistic,
  });

  factory RouteDetail.fromJson(Map<String, dynamic> json) => RouteDetail(
        objectInfo: ObjectInfo.fromJson(json["object_info"]),
        isFavorite: json["is_favorite"],
        reportsStatistic:
            List<ReportsStatistic>.from(json["reports_statistic"].map((x) => ReportsStatistic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "object_info": objectInfo.toJson(),
        "is_favorite": isFavorite,
        "reports_statistic": List<dynamic>.from(reportsStatistic.map((x) => x.toJson())),
      };
}

class ObjectInfo {
  int? pk;
  String? name;
  String? duration;
  String? locality;
  double? length;
  String? description;
  String? startN;
  String? startE;
  String? endN;
  String? endE;
  double? avgAvailability;
  double? avgBeauty;
  double? avgPurity;
  String? photo;

  ObjectInfo({
    required this.pk,
    required this.name,
    required this.duration,
    required this.locality,
    required this.length,
    required this.description,
    required this.startN,
    required this.startE,
    required this.endN,
    required this.endE,
    required this.avgAvailability,
    required this.avgBeauty,
    required this.avgPurity,
    required this.photo,
  });

  factory ObjectInfo.fromJson(Map<String, dynamic> json) => ObjectInfo(
        pk: json["pk"],
        name: json["name"],
        duration: json["duration"],
        locality: json["locality"],
        length: json["length"],
        description: json["description"],
        startN: json["start_n"],
        startE: json["start_e"],
        endN: json["end_n"],
        endE: json["end_e"],
        avgAvailability: json["avg_availability"],
        avgBeauty: json["avg_beauty"],
        avgPurity: json["avg_purity"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "name": name,
        "duration": duration,
        "locality": locality,
        "length": length,
        "description": description,
        "start_n": startN,
        "start_e": startE,
        "end_n": endN,
        "end_e": endE,
        "avg_availability": avgAvailability,
        "avg_beauty": avgBeauty,
        "avg_purity": avgPurity,
        "photo": photo,
      };
}

class ReportsStatistic {
  String? resultsWasteIdUnitOfWaste;
  double? sumAmount;
  String? type;
  String? unit;

  ReportsStatistic({
    required this.resultsWasteIdUnitOfWaste,
    required this.sumAmount,
    required this.type,
    required this.unit,
  });

  factory ReportsStatistic.fromJson(Map<String, dynamic> json) => ReportsStatistic(
        resultsWasteIdUnitOfWaste: json["results__waste_id__unit_of_waste"],
        sumAmount: json["sum_amount"],
        type: json["type"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "results__waste_id__unit_of_waste": resultsWasteIdUnitOfWaste,
        "sum_amount": sumAmount,
        "type": type,
        "unit": unit,
      };
}
