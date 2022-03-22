import 'package:flutter/material.dart';
import 'package:g7/controller/controller.dart';
import 'package:g7/screen/base.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';


class ProductCategory extends StatefulWidget {
  String catName;
  ProductCategory({required this.catName});
  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  bool shouldPop = true;
  int? tappedIndex;

  @override
  void deactivate() {
    Provider.of<Controller>(context, listen: false).clearsubCategory();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> category = [];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(widget.catName.toString()),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          // scrollDirection: Axis.vertical,
          child: Consumer<Controller>(
            builder: (context, value, child) {
              if (value.isLoading == true) {
                return Center(
                  // alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              } else {
                if (value.subcategoryList!.length == 0 ||
                    value.subcategoryList! == null ||
                    value.subcategoryList!.isEmpty) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    // height: size.height * 0.75,
                    alignment: Alignment.center,
                    child: Text(
                      "No Products Exist in ${widget.catName}",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  // value.isLoading=false;
                  print(
                      "length;;;;;;;;;;;;;;;;${value.subcategoryList!.length}");
                  return SingleChildScrollView(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.subcategoryList!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: tappedIndex == index
                                  ? Colors.red
                                  : Colors.grey[300],
                            ),
                            child: ListTile(
                              onTap: () {
                                value.postProductList(
                                    value.subcategoryList![index]["cat_id"],
                                    context);
                                setState(() {
                                  tappedIndex = index;
                                }); // remove setstate ==> user value notifier
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Base(
                                      batchname: value.subcategoryList![index]["cat_name"],
                                    ),
                                  ),
                                );
                                // });
                              },
                              title: Text(
                                value.subcategoryList![index]["cat_name"],
                                style: TextStyle(
                                    // fontFamily: "poppins",
                                    fontSize: 20,
                                    color: tappedIndex == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            },
          ),
        ));
  }
}