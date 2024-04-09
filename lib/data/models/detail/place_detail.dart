import 'dart:convert';

PlaceDetail placeDetailFromJson(String str) => PlaceDetail.fromJson(json.decode(str));

String placeDetailToJson(PlaceDetail data) => json.encode(data.toJson());

class PlaceDetail {
  ObjectInfo objectInfo;
  bool isFavorite;
  List<ReportsStatistic> reportsStatistic;

  PlaceDetail({
    required this.objectInfo,
    required this.isFavorite,
    required this.reportsStatistic,
  });

  factory PlaceDetail.fromJson(Map<String, dynamic> json) => PlaceDetail(
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
  String? locality;
  int objectId;
  String? name;
  String? description;
  String? photo;
  String? latitudeN;
  String? longitudeE;
  double? avgAvailability;
  double? avgBeauty;
  double? avgPurity;

  ObjectInfo({
    required this.locality,
    required this.objectId,
    required this.name,
    required this.description,
    required this.photo,
    required this.latitudeN,
    required this.longitudeE,
    required this.avgAvailability,
    required this.avgBeauty,
    required this.avgPurity,
  });

  factory ObjectInfo.fromJson(Map<String, dynamic> json) => ObjectInfo(
        locality: json["locality"],
        objectId: json["object_id"],
        name: json["name"],
        description: json["description"],
        photo: json["photo"],
        latitudeN: json["latitude_n"],
        longitudeE: json["longitude_e"],
        avgAvailability: json["avg_availability"],
        avgBeauty: json["avg_beauty"]?.toDouble(),
        avgPurity: json["avg_purity"],
      );

  Map<String, dynamic> toJson() => {
        "locality": locality,
        "object_id": objectId,
        "name": name,
        "description": description,
        "photo": photo,
        "latitude_n": latitudeN,
        "longitude_e": longitudeE,
        "avg_availability": avgAvailability,
        "avg_beauty": avgBeauty,
        "avg_purity": avgPurity,
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
