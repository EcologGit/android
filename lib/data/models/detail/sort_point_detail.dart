import 'dart:convert';

SortPointDetail sortPointDetailFromJson(String str) => SortPointDetail.fromJson(json.decode(str));

String sortPointDetailToJson(SortPointDetail data) => json.encode(data.toJson());

class SortPointDetail {
  String? photo;
  int pk;
  String? name;
  String? schedule;
  String? description;
  String? locality;
  String? latitudeN;
  String? longitudeE;
  List<WastType> wastTypes;
  bool isFavorite;
  List<ReportsStatistic> reportsStatistic;

  SortPointDetail({
    required this.photo,
    required this.pk,
    required this.name,
    required this.schedule,
    required this.description,
    required this.locality,
    required this.latitudeN,
    required this.longitudeE,
    required this.wastTypes,
    required this.isFavorite,
    required this.reportsStatistic,
  });

  factory SortPointDetail.fromJson(Map<String, dynamic> json) => SortPointDetail(
        photo: json["photo"],
        pk: json["pk"],
        name: json["name"],
        schedule: json["schedule"],
        description: json["description"],
        locality: json["locality"],
        latitudeN: json["latitude_n"],
        longitudeE: json["longitude_e"],
        wastTypes: List<WastType>.from(json["wast_types"].map((x) => WastType.fromJson(x))),
        isFavorite: json["is_favorite"],
        reportsStatistic:
            List<ReportsStatistic>.from(json["reports_statistic"].map((x) => ReportsStatistic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "pk": pk,
        "name": name,
        "schedule": schedule,
        "description": description,
        "locality": locality,
        "latitude_n": latitudeN,
        "longitude_e": longitudeE,
        "wast_types": List<dynamic>.from(wastTypes.map((x) => x.toJson())),
        "is_favorite": isFavorite,
        "reports_statistic": List<dynamic>.from(reportsStatistic.map((x) => x.toJson())),
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

class WastType {
  String? name;

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
