import 'package:flutter/material.dart';
import 'package:g7/controller/controller.dart';
import 'package:g7/screen/productCategory.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isSelected = false;
  int? tappedIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      // final auth =
      Provider.of<Controller>(context, listen: false).postCategory(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("Zoqa"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Consumer<Controller>(
          builder: (context, value, child) {
            if (value.categoryList == null) {
              return Center(
                child: Text("No data...."),
              );
            } else {
              return ListView.builder(
                itemCount: value.categoryList!.length,
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
                        title: Text(
                          value.categoryList![index]["mc_name"].toUpperCase(),
                          style: TextStyle(
                              // fontFamily: "fantasy",
                              fontSize: 20,
                              color: tappedIndex == index
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        onTap: () {
                          setState(() {
                            tappedIndex = index;
                          });

                          value.postsubCategory(
                              value.categoryList![index]["mc_id"], context);
                          print(
                              "mc_id-----${value.categoryList![index]["mc_id"]}");
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //       type: PageTransitionType.rightToLeft,
                          //       child: ProductCategory(
                          //         catName: value.categoryList![index]
                          //             ["mc_name"],
                          //       ),
                          //       inheritTheme: true,
                          //       ctx: context),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductCategory(
                                catName: value.categoryList![index]["mc_name"],
                              ),
                            ),
                          );
                          // });
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
