// To parse this JSON data, do
//
//     final skill = skillFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SkillModel skillFromJson(String str) => SkillModel.fromJson(json.decode(str));

String skillToJson(SkillModel data) => json.encode(data.toJson());

class SkillModel {
  SkillModel({
    required this.name,
    required this.checkName,
    required this.id,
  });

  String name;
  String checkName;
  String id;

  SkillModel copyWith({
    String? name,
    String? checkName,
    String? id,
  }) =>
      SkillModel(
        name: name ?? this.name,
        checkName: checkName ?? this.checkName,
        id: id ?? this.id,
      );

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        name: json["name"] == null ? null : json["name"],
        checkName: json["check_name"] == null ? null : json["check_name"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "check_name": checkName == null ? null : checkName,
        "id": id == null ? null : id,
      };
}
