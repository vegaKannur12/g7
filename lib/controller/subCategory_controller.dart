// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:zoqa/model/category_model.dart';
// import 'package:zoqa/model/subCategory_model.dart';

// class SubCategoryController extends ChangeNotifier{
//   List<MainCategoryModel?> categoryList = [];
//   List<MainCategoryModel?> newCategorylist = [];
//   /////////////////////////////////////////
//    postCategory() async {
  
//       try {
//         Uri url = Uri.parse("http://zoqa.in/women/api/category_list.php");
        
//         http.Response response = await http.post(
//           url,
//           // body: body,
//         );
//         var map = jsonDecode(response.body);
//         print("from post data ${map}");

//         SubCategoryModel categoryModel= SubCategoryModel.fromJson(map);
//         subcategoryList = subcategoryModel as List<SubCategoryModel?>;
//         //print(datalist.length);

//         subcategoryList.map((e) {
//           newCategorylist.add(e);
          
//           // print("item ${e!.product}");
//         },).toList();

//         print(newCategorylist.length);
        
//         newCategorylist.map((e) {
//           print("category name-----------${e!.cat_name}");
//         }).toList();
//         // datalist.clear();
//         //print("new datalist-------${newDatalist}");
//         notifyListeners();
//       } catch (e) {
//         print(e);
//         return null;
//       }
    
//   }
//   ////////////////////////////////////////
// }
