import 'package:flutter/material.dart';

class MainCategoryModel {
  String? mcId;
  String? mcName;

  MainCategoryModel({this.mcId, this.mcName});

  MainCategoryModel.fromJson(Map<String, dynamic> json) {
    mcId = json['mc_id'];
    mcName = json['mc_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mc_id'] = this.mcId;
    data['mc_name'] = this.mcName;
    return data;
  }
}
