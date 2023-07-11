import 'package:flutter/material.dart';
import 'package:g7/controller/controller.dart';
import 'package:g7/screen/productCategory.dart';
import 'package:g7/screen/product_details.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController _controller = TextEditingController();
  Icon actionIcon = Icon(Icons.search);
  Widget? appBarTitle;
  // bool isSearch = false;
  bool isSelected = false;
  int? tappedIndex;
  String searchKey = "";
  bool visible = false;
  // List<MainCategoryModel> newList=[];
  List<Map<String, dynamic>>? newList = [];
  void togle() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appBarTitle = Text("G7");
    Future.delayed(Duration(seconds: 0), () {
      // final auth =
      Provider.of<Controller>(context, listen: false).postCategory(context);
      // newList = Provider.of<Controller>(context, listen: false).categoryList;
    });
  }

  onChangedValue(String value) {
    print("value inside function ---${value}");
    setState(() {
      searchKey = value;
      if (value.isEmpty) {
        Provider.of<Controller>(context, listen: false).setIssearch(false);
        _controller.clear();
      } else {
        Provider.of<Controller>(context, listen: false).setIssearch(true);

        // _controller.clear();

        // newList = Provider.of<Controller>(context, listen: false)
        //     .categoryList!
        //     .where((cat) =>
        //         cat["mc_name"].toUpperCase().startsWith(value.toUpperCase()))
        //     .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: [
          IconButton(
            icon: actionIcon,
            onPressed: () {
              togle();
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  print("hai");
                  _controller.clear();
                  this.actionIcon = Icon(Icons.close);
                  this.appBarTitle = TextField(
                      controller: _controller,
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onChanged: ((value) {
                        print(value);
                        onChangedValue(value);
                      }),
                      cursorColor: Colors.black);
                } else {
                  if (this.actionIcon.icon == Icons.close) {
                    print("hellooo");
                    this.actionIcon = Icon(Icons.search);
                    this.appBarTitle = Text("G7");
                    Provider.of<Controller>(context, listen: false)
                        .setIssearch(false);
                  }
                }
              },);
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
                      .productDetails(_controller.text, "0", "0", context, "1");
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
          width: double.infinity,
          height: double.infinity,
          child:
              // isSearch
              //     ?
              Consumer<Controller>(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductCategory(
                                  catName: value.categoryList![index]
                                      ["mc_name"],
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
          )),
      // : Center(
      //     child: Text("No Result Found"),
      //   )),
    );
  }
}
