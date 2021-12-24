import 'package:devsload/models/skill.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

MyUser myUserFromJson(String str) => MyUser.fromJson(json.decode(str));

String myUserToJson(MyUser data) => json.encode(data.toJson());

class MyUser {
  MyUser({
    required this.uid,
    required this.email,
    required this.nickName,
    required this.introduce,
    required this.profile,
    required this.push,
    required this.hide,
    required this.deviceToken,
    required this.skills,
  });

  String uid;
  String email;
  String nickName;
  String introduce;
  String profile;
  bool push;
  bool hide;
  String deviceToken;
  List<Skill> skills;

  MyUser copyWith({
    String? uid,
    String? email,
    String? nickName,
    String? introduce,
    String? profile,
    bool? push,
    bool? hide,
    String? deviceToken,
    List<Skill>? skills,
  }) =>
      MyUser(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        nickName: nickName ?? this.nickName,
        introduce: introduce ?? this.introduce,
        profile: profile ?? this.profile,
        push: push ?? this.push,
        hide: hide ?? this.hide,
        deviceToken: deviceToken ?? this.deviceToken,
        skills: skills ?? this.skills,
      );

  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
        uid: json["uid"] == null ? null : json["uid"],
        email: json["email"] == null ? null : json["email"],
        nickName: json["nickName"] == null ? null : json["nickName"],
        introduce: json["introduce"] == null ? null : json["introduce"],
        profile: json["profile"] == null ? null : json["profile"],
        push: json["_push"] == null ? null : json["_push"],
        hide: json["_hide"] == null ? null : json["_hide"],
        deviceToken:
            json["_device_token"] == null ? null : json["_device_token"],
        skills: json["skills"] == null
            ? []
            : List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid == null ? null : uid,
        "email": email == null ? null : email,
        "nickName": nickName == null ? null : nickName,
        "introduce": introduce == null ? null : introduce,
        "profile": profile == null ? null : profile,
        "_push": push == null ? null : push,
        "_hide": hide == null ? null : hide,
        "_device_token": deviceToken == null ? null : deviceToken,
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills.map((x) => x.toJson())),
      };
}
