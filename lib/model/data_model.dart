// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.v,
  });

  String? id;
  String? title;
  String? description;
  DateTime? date;
  int? v;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "date": date == null ? null : date!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
