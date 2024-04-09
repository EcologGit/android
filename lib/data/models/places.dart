import 'dart:convert';

class Places {
  int count;
  dynamic next;
  dynamic previous;
  List<Place> places;

  Places({
    required this.count,
    required this.next,
    required this.previous,
    required this.places,
  });

  factory Places.fromRawJson(String str) => Places.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        places: List<Place>.from(json["results"].map((place) => Place.fromJson(place))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(places.map((x) => x.toJson())),
      };
}

class Place {
  String locality;
  int objectId;
  String name;
  String description;
  String? photo;
  double? avgAvailability;
  double? avgBeauty;
  double? avgPurity;
  bool? isFavourite;

  Place({
    required this.locality,
    required this.objectId,
    required this.name,
    required this.description,
    required this.photo,
    required this.avgAvailability,
    required this.avgBeauty,
    required this.avgPurity,
    required this.isFavourite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locality': locality,
      'object_id': objectId,
      'name': name,
      'description': description,
      'photo': photo,
      'avg_availability': avgAvailability,
      'avg_beauty': avgBeauty,
      'avg_purity': avgPurity,
      'is_favourite': isFavourite,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      locality: map['locality'] as String,
      objectId: map['object_id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      photo: map['photo'] != null ? map['photo'] as String : null,
      avgAvailability: map['avg_availability'] != null ? map['avg_availability'] as double : null,
      avgBeauty: map['avg_beauty'] != null ? map['avg_beauty'] as double : null,
      avgPurity: map['avg_purity'] != null ? map['avg_purity'] as double : null,
      isFavourite: map['is_favourite'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        locality: json['locality'] as String,
        objectId: json['object_id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        photo: json['photo'] != null ? json['photo'] as String : null,
        avgAvailability: json['avg_availability'] != null ? json['avg_availability'] as double : null,
        avgBeauty: json['avg_beauty'] != null ? json['avg_beauty'] as double : null,
        avgPurity: json['avg_purity'] != null ? json['avg_purity'] as double : null,
        isFavourite: json['is_favourite'] as dynamic,
      );
}
