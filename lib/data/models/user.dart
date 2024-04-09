import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int pk;
  dynamic photo;
  String? firstName;
  String? lastName;
  String? username;
  String? locality;
  String? birthDate;
  String? sex;
  String? email;
  String? phoneNumber;
  String? kindOfActivity;

  User({
    required this.pk,
    this.photo,
    this.firstName,
    this.lastName,
    this.username,
    this.locality,
    this.birthDate,
    this.sex,
    this.email,
    this.phoneNumber,
    this.kindOfActivity,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        pk: json["pk"],
        photo: json["photo"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        locality: json["locality"],
        birthDate: json["birth_date"],
        sex: json["sex"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        kindOfActivity: json["kind_of_activity"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "photo": photo,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "locality": locality,
        "birth_date": birthDate,
        "sex": sex,
        "email": email,
        "phone_number": phoneNumber,
        "kind_of_activity": kindOfActivity,
      };
}
