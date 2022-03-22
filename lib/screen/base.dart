import 'package:flutter/material.dart';
import 'package:g7/controller/controller.dart';
import 'package:g7/myservice.dart';
import 'package:g7/screen/product_details.dart';
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
  // Globaldata globaldata=Globaldata();
  int _currentIndex = 0;
  String imgGlobal = Globaldata.imageurl;
  // String imgGlobal = "http://trafiqerp.in/webapp/g7/files/";
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    Provider.of<Controller>(context, listen: false).clearprodlist();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
            widget.batchname.toString(),
            ),
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
              itemCount: value.productList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: .57,
              ),
              padding: EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  // onTap: () {
                  // },
                  child: GestureDetector(
                    onTap: () {
                      value.productDetails(
                        value.productList![index]["product_code"],
                        value.productList![index]["batch_code"],
                        value.productList![index]["color_ids"],
                        context,
                      );
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //       type: PageTransitionType.rightToLeft,
                      //       child: ProductDetails(),
                      //       inheritTheme: true,
                      //       ctx: context),
                      // );
                      // Future.delayed(Duration(milliseconds: 190), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            itemName: value.productList![index]["cat_name"],
                            colorid: value.productList![index]["color_ids"],
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
                          // Container(
                          //   child: FadeInImage.memoryNetwork(
                          //     fit: BoxFit.fill,
                          //     image: imgGlobal +
                          //         value.productList![index]["pi_files"],
                          //     placeholder: kTransparentImage,
                          //     imageErrorBuilder: (context, error, stacktrace) {
                          //       return FadeInImage.memoryNetwork(
                          //         fit: BoxFit.fill,
                          //         placeholder: kTransparentImage,
                          //         image: imgGlobal +
                          //             value.productList![index]["pi_files"],
                          //         imageErrorBuilder:
                          //             (context, error, stacktrace) {
                          //           return Center(
                          //               child: Text('Image Not Available'));
                          //         },
                          //       );

                          //     },
                          //     //  (context, url) =>
                          //     //     new CircularProgressIndicator(),
                          //     // errorWidget: (context, url, error) =>
                          //     //     new Icon(Icons.error),
                          //   ),
                          // ),
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
                            height: size.height*0.4,
                            child: FadeInImage(
                              fit: BoxFit.fill,
                              placeholder: AssetImage(
                                  "asset/ajax_loader.gif"),
                              image: NetworkImage(
                                imgGlobal +
                                    value.productList![index]["pi_files"],
                                  
                              ),
                            //  imageErrorBuilder:
                            //           (context, error, stacktrace) {
                            //         return Center(
                            //             child: Text('Image Not Available'));
                            //   },
                            ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       image: NetworkImage(
                          //         imgGlobal +
                          //             value.productList![index]["pi_files"],
                          //       ),
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
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
