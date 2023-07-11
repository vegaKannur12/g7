import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g7/controller/controller.dart';
import 'package:g7/myservice.dart';
import 'package:g7/screen/imageSize.dart';
import 'package:g7/screen/product_details.dart';
import 'package:g7/screen/search.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Base extends StatefulWidget {
  String batchname;
  Base({required this.batchname});
  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  ImageResize imageResize = ImageResize();

  int col = 2;
  double paddingtop = 5;
  double paddingbottom = 5;
  double paddingleft = 5;
  double paddingright = 5;
  double imagewidth = 600;
  double imageheight = 800;
  double description1Height = 20;
  double description2Height = 10;
  List result = [];

  double? imageActualWidth;
  double? imageActualheight;
  double? containerActualHieght;
  double? cont_actual_h_prop;

  TextEditingController _controller = TextEditingController();
  Icon actionIcon = Icon(Icons.search);
  Widget? appBarTitle;

  int? tappedIndex;
  List<Map<String, dynamic>>? newList = [];
  var myDynamicAspectRatio = 1000 / 1;
  late OverlayEntry sticky;
  int _currentIndex = 0;
  String imgGlobal = Globaldata.imageurl;
  String searchKey = "";
  bool visible = false;
  // String imgGlobal = "http://trafiqerp.in/webapp/g7/files/";
  void togle() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  void deactivate() {
    Provider.of<Controller>(context, listen: false).clearprodlist();
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appBarTitle = Text(widget.batchname);
    Provider.of<Controller>(context, listen: false)
        .postProductList("0", context);
    newList = Provider.of<Controller>(context, listen: false).productList;
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
        newList = Provider.of<Controller>(context, listen: false)
            .productList!
            .where((code) => code["product_code"]
                .toUpperCase()
                .startsWith(value.toUpperCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    result = imageResize.imageResizeFun(
        screenwidth,
        screenheight,
        description1Height,
        description2Height,
        paddingtop,
        paddingbottom,
        paddingright,
        paddingleft,
        imagewidth,
        imageheight,
        col);
    containerActualHieght = result[0];
    imageActualWidth = result[1];
    imageActualheight = result[2];
    cont_actual_h_prop = result[3];
    print("kfdfjk------------------$cont_actual_h_prop");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                if (this.actionIcon.icon == Icons.search) {
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
                        // print(value);
                        onChangedValue(value);
                      }),
                      cursorColor: Colors.black);
                } else {
                  if (this.actionIcon.icon == Icons.close) {
                    this.actionIcon = Icon(Icons.search);
                    this.appBarTitle = Text(widget.batchname);
                    Provider.of<Controller>(context, listen: false)
                        .setIssearch(false);
                  }
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
      body: Consumer<Controller>(builder: (context, value, child) {
        if (value.isLoading == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (value.productList!.length == 0 ||
              value.productList! == null ||
              value.productList!.isEmpty) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "No more Products...",
                style: TextStyle(fontSize: 20),
              ),
            );
            // return Container(
            //   height: size.height * 0.75,
            //   alignment: Alignment.center,
            //   child: Text(
            //     "No More Products ",
            //     style: TextStyle(fontSize: 20),
            //   ),
            // );
          } else {
            return GridView.builder(
              // itemCount: value.productList!.length,
              itemCount: value.productList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                // childAspectRatio:
                childAspectRatio: cont_actual_h_prop!,
              ),
              padding: EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  // onTap: () {
                  // },
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      value.productDetails(
                          value.productList![index]["product_code"],
                          value.productList![index]["batch_code"],
                          value.productList![index]["color_ids"],
                          context,
                          "0");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                              // itemName: value.productList![index]
                              //     ["cat_name"],
                              // colorid: value.productList![index]
                              //     ["color_ids"],
                              ),
                        ),
                      );
                      // });
                    },
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.fromLTRB(0.0, 4.0, 4.0, 4.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      shadowColor: Colors.white,
                      color: Colors.white70,
                      child: Stack(
                        children: [
                          Container(
                            child: RichText(
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: TextStyle(color: Colors.red),
                                text: value.productList![index]["product_code"],
                              ),
                            ),
                          ),
                          Container(
                            height: containerActualHieght,
                            child: FadeInImage(
                              height: imageActualheight,
                              width: imageActualWidth,
                              fit: BoxFit.fill,
                              placeholder: AssetImage("asset/ajax_loader.gif"),
                              image: NetworkImage(
                                imgGlobal +
                                    value.productList![index]["pi_files"],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: RichText(
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: value.productList![index]["product_code"],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: size.width * 0.9,
                                // height: size.height*0.04,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: RichText(
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                    text: value.productList![index]["cat_name"],
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    )),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 13),
                                    text: "Rs:" +
                                        value.productList![index]["s_rate"],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
      }),
      // bottomNavigationBar: Bottombar(),
    );
  }
}
