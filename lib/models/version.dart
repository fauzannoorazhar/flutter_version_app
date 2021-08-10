import 'package:flutter/material.dart';

class Version {
  DateTime versionDate;
  String versionCode;
  String versionName;

  Version({
    @required this.versionDate,
    @required this.versionCode,
    @required this.versionName,
  });

  Version.fromJson(Map<String, dynamic> json) {
    try {
      versionCode = json['versionCode'];
      versionName = json['versionName'];
      versionDate = DateTime.parse(json['versionDate']);
    } catch (e) {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['versionCode'] = this.versionCode;
    data['versionName'] = this.versionName;
    data['versionDate'] = this.versionDate;

    return data;
  }
}