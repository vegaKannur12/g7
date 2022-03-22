import 'package:flutter/material.dart';

class ProductDetailsModel {
  List<Images>? images;
  List<ProductInfo>? productInfo;
  List<AvailableSize>? availableSize;
  List<AvailableColors>? availableColors;

  ProductDetailsModel(
      {this.images,
      this.productInfo,
      this.availableSize,
      this.availableColors});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['product_info'] != null) {
      productInfo = <ProductInfo>[];
      json['product_info'].forEach((v) {
        productInfo!.add(ProductInfo.fromJson(v));
      });
    }
    if (json['available_size'] != null) {
      availableSize = <AvailableSize>[];
      json['available_size'].forEach((v) {
        availableSize!.add(AvailableSize.fromJson(v));
      });
    }
    if (json['available_colors'] != null) {
      availableColors = <AvailableColors>[];
      json['available_colors'].forEach((v) {
        availableColors!.add(new AvailableColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (productInfo != null) {
      data['product_info'] = productInfo!.map((v) => v.toJson()).toList();
    }
    if (availableSize != null) {
      data['available_size'] = availableSize!.map((v) => v.toJson()).toList();
    }
    if (availableColors != null) {
      data['available_colors'] =
          availableColors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableColors {
  String? batchCode;
  String? batchGender;
  String? catId;
  String? colorId;
  String? colorName;
  String? colorHex;
  String? piFiles;

  AvailableColors(
      {this.batchCode,
      this.batchGender,
      this.catId,
      this.colorId,
      this.colorName,
      this.colorHex,
      this.piFiles});

  AvailableColors.fromJson(Map<String, dynamic> json) {
    batchCode = json['batch_code'];
    batchGender = json['batch_gender'];
    catId = json['cat_id'];
    colorId = json['color_id'];
    colorName = json['color_name'];
    colorHex = json['color_hex'];
    piFiles = json['pi_files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batch_code'] = batchCode;
    data['batch_gender'] = batchGender;
    data['cat_id'] = catId;
    data['color_id'] = colorId;
    data['color_name'] = colorName;
    data['color_hex'] = colorHex;
    data['pi_files'] = piFiles;
    return data;
  }
}

class Images {
  String? piFiles;

  Images({this.piFiles});

  Images.fromJson(Map<String, dynamic> json) {
    piFiles = json['pi_files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pi_files'] = this.piFiles;
    return data;
  }
}

class AvailableSize {
  String? batch_code;
  String? m_name;
  String? batch_gender;
  String? cat_id;
  String? m_id;

  AvailableSize(
      {this.batch_code,
      this.batch_gender,
      this.cat_id,
      this.m_id,
      this.m_name});

  AvailableSize.fromJson(Map<String, dynamic> json) {
    batch_code = json["batch_code"];
    m_name = json["m_name"];
    batch_gender = json["batch_gender"];
    cat_id = json["cat_id"];
    m_id = json["m_id"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["batch_code"] = this.batch_code;
    data["m_name"] = this.m_name;
    data["batch_gender"] = this.batch_gender;
    data["cat_id"] = this.cat_id;
    data["m_id"] = this.m_id;

    return data;
  }
}

class ProductInfo {
  String? cat_id;
  String? m_id;

  String? cat_name;

  String? added_on;

  String? product_code;
  String? batch_code;

  String? s_rate;
  String? color_id;

  String? item_name;
  String? batch_id;
  String? color_name;
  ProductInfo.fromJson(Map<String, dynamic> json) {
    cat_id = json["cat_id"];
    m_id = json["m_id"];
    cat_name = json["cat_name"];
    added_on = json["added_on"];
    product_code = json["product_code"];
    batch_code = json["batch_code"];
    s_rate = json["s_rate"];
    color_id = json["color_id"];
    item_name = json["item_name"];
    batch_id = json["batch_id"];
    color_name = json["color_name"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["cat_id"] = this.cat_id;
    data["m_id"] = this.m_id;
    data["cat_name"] = this.cat_name;
    data["added_on"] = this.added_on;
    data["product_code"] = this.product_code;
      data["batch_code"] = this.batch_code;
    data["s_rate"] = this.s_rate;
    data["color_id"] = this.color_id;
    data["item_name"] = this.item_name;

    data["batch_id"] = this.batch_id;
    data["color_name"] = this.color_name;

    return data;
  }
}
