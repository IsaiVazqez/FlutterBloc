// To parse this JSON data, do
//
//     final getDataModel = getDataModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

GetDataModel getDataModelFromJson(String str) =>
    GetDataModel.fromJson(json.decode(str));

String getDataModelToJson(GetDataModel data) => json.encode(data.toJson());

class GetDataModel {
  GetDataModel({
    this.message,
    this.people,
    this.number,
  });

  String? message;
  List<Person>? people;
  int? number;

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
        message: json["message"] == null ? null : json["message"],
        people: json["people"] == null
            ? null
            : List<Person>.from(json["people"].map((x) => Person.fromJson(x))),
        number: json["number"] == null ? null : json["number"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "people": people == null
            ? null
            : List<dynamic>.from(people!.map((x) => x.toJson())),
        "number": number == null ? null : number,
      };
}

class Person {
  Person({
    this.craft,
    this.name,
  });

  String? craft;
  String? name;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        craft: json["craft"] == null ? null : json["craft"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "craft": craft == null ? null : craft,
        "name": name == null ? null : name,
      };
}
