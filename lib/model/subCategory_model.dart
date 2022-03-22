class SubCategoryModel {
  String? catId;
  String? catName;

  SubCategoryModel({this.catId, this.catName});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    return data;
  }
}