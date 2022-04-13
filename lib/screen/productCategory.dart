import 'package:flutter/material.dart';
import 'package:g7/controller/controller.dart';
import 'package:g7/screen/base.dart';
import 'package:g7/screen/product_details.dart';
import 'package:provider/provider.dart';

class ProductCategory extends StatefulWidget {
  String catName;
  ProductCategory({required this.catName});
  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  Widget appBarTitle = Text("G7");
  TextEditingController text = TextEditingController();

  // bool isSearch = false;
  Icon actionIcon = Icon(Icons.search);
  bool shouldPop = true;
  int? tappedIndex;
  String searchKey = "";
  bool visible = false;
  List<Map<String, dynamic>>? newList = [];
  void togle() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  void deactivate() {
    Provider.of<Controller>(context, listen: false).clearsubCategory();
    super.deactivate();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newList = Provider.of<Controller>(context, listen: false).categoryList;
  }

  onChangedValue(String value) {
    print("value inside function ---${value}");
    setState(() {
      searchKey = value;
      if (value.isEmpty) {
        Provider.of<Controller>(context, listen: false).setIssearch(false);
      } else {
        Provider.of<Controller>(context, listen: false).setIssearch(true);

        newList = Provider.of<Controller>(context, listen: false)
            .subcategoryList!
            .where((cat) =>
                cat["cat_name"].toUpperCase().startsWith(value.toUpperCase()))
            .toList();
      }
    });
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
          title: appBarTitle,
          actions: [
            IconButton(
              icon: actionIcon,
              onPressed: () {
                togle();
                setState(() {
                  if (this.actionIcon.icon == Icons.search &&
                      Provider.of<Controller>(context, listen: false)
                              .isSearch ==
                          false) {
                    this.actionIcon = new Icon(Icons.close);
                    this.appBarTitle = new TextField(
                        controller: text,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                          prefixIcon:
                              new Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.white),
                        ),
                        onChanged: ((value) {
                          print(value);
                          onChangedValue(value);
                        }),
                        cursorColor: Colors.black);
                  }
                  // else if (this.actionIcon.icon == Icons.close &&
                  //     newList!.length == 0) {
                  //   isSearch = false;
                  //   text.clear();
                  // } else if (this.actionIcon.icon == Icons.close &&
                  //     newList!.length > 0) {
                  //   this.actionIcon = Icon(Icons.search);
                  //   this.appBarTitle = appBarTitle;
                  //   isSearch = false;
                  //   text.clear();
                  // }
                  else if (this.actionIcon.icon == Icons.close) {
                    this.actionIcon = Icon(Icons.search);
                    this.appBarTitle = Text("G7");
                    Provider.of<Controller>(context, listen: false)
                        .setIssearch(false);

                    text.clear();
                  }
                });
              },
            ),
            Visibility(
              visible: visible,
              child: IconButton(
                  onPressed: () {
                    // setState(() {
                    //   isSearch = true;
                    // });
                    Provider.of<Controller>(context, listen: false)
                        .productDetails(text.text, "0", "0", context, "1");
                    if (Provider.of<Controller>(context, listen: false)
                            .isSearch ==
                        true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                              // itemName: Provider.of<Controller>(context, listen: false).productList![index]["cat_name"],
                              // colorid: Provider.of<Controller>(context, listen: false).productList![index]["color_ids"],
                              ),
                        ),
                      );
                    }
                  },
                  icon: Icon(Icons.done)),
            )
          ],
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
                                      batchname: value.subcategoryList![index]
                                          ["cat_name"],
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
