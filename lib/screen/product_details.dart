import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:g7/controller/controller.dart';
import 'package:g7/model/product_detail_model.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetails extends StatefulWidget {
  String itemName;
  String colorid;
  ProductDetails({required this.itemName, required this.colorid});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final scrollController = ScrollController();
  String color_id = "";
  String batch_code = "";
  String product_code = "";
  String imageurl = "http://zoqa.in/women/";
  // String imageurl = "http://trafiqerp.in/webapp/g7/files/";
  final CarouselController _buttonCarouselController = CarouselController();
  bool isAutoPlayEnabled = true;
  int _current = 0;
  bool textClicked = false;
  String selected = "";
  String selctedSize = "";
  // int index = 0;
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    Provider.of<Controller>(context, listen: false).clearproductdetails();
  }

  @override
  void initState() async{
    // TODO: implement initState
    super.initState();
    // print("init............${selected}");
    selected = widget.colorid;
    setPosition();

    //
  }

  setPosition()async{
    await scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);

  }

  @override
  Widget build(BuildContext context) {
    // selected = widget.colorid;
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.itemName,
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<Controller>(
            builder: (context, value, child) {
              if (value.isLoading == true) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //  SizedBox(
                    //   height: size.height * 0.02,
                    // ),
                    // Text(
                    //   value.productInfoList != null &&
                    //           value.productInfoList!.length > 0
                    //       ? value.productInfoList![0].item_name!
                    //       : " ",
                    //   style:
                    //       TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    value.imageList == null || value.imageList!.isEmpty
                        ? Container(
                            // height: size.height * 0.9,
                            width: size.width * 0.8,
                            child: Image.asset("asset/no-img.png"))
                        : CarouselSlider(
                            items: value.imageList!.map((image) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    // width: MediaQuery.of(context).size.width,
                                    width: size.width * 0.9,
                                    // height: size.height * 0.9,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 0.0),
                                    child: Image.network(
                                      imageurl + image.piFiles!,
                                      fit: BoxFit.fill,
                                      //  height: 300,width: 600,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                                enlargeCenterPage: true,
                                autoPlayInterval: Duration(seconds: 2),
                                aspectRatio: 0,
                                height: size.height * 0.5,
                                autoPlay: isAutoPlayEnabled,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: value.imageList!.map(
                        (image) {
                          int indexcaro = value.imageList!.indexOf(image);
                          // print("index of image-----${indexcaro}");
                          return Container(
                            width: size.width * 0.02,
                            height: size.height * 0.02,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == indexcaro
                                    ? Color.fromRGBO(0, 0, 0, 0.4)
                                    : Color.fromARGB(228, 211, 203, 203)),
                          );
                        },
                      ).toList(), // this was the part the I had to add
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      value.productInfoList != null &&
                              value.productInfoList!.length > 0
                          ? "(PCODE : ${value.productInfoList![0].product_code} ,  ICODE : ${value.productInfoList![0].batch_code})"
                          : "",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.color_lens,
                          color: Colors.red,
                        ),
                        Container(
                          width: size.width * 0.3,
                          child: Text(
                            "Color",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: size.width * 0.1,
                          child: Text(":"),
                        ),
                        Expanded(
                          child: Text(
                            value.productInfoList != null &&
                                    value.productInfoList!.length > 0
                                ? "${value.productInfoList![0].color_name!}"
                                : " ",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        )
                        // RichText(
                        //   // textAlign: TextAlign.start,
                        //   overflow: TextOverflow.ellipsis,
                        //   maxLines: 2,
                        //   text:TextSpan(
                        //     text: value.productInfoList != null &&
                        //           value.productInfoList!.length > 0
                        //       ? value.productInfoList![0].color_name!
                        //       : " ",
                        //   style: TextStyle(
                        //     fontSize: 17,
                        //   ),
                        //   )
                        // ),
                        // RichText(
                        //   textAlign: TextAlign.end,
                        //   overflow: TextOverflow.ellipsis,
                        //   text: TextSpan(
                        //     text: "No image",
                        //     // value
                        //     //     .colorList![indexlisview]
                        //     //     .colorName!
                        //     //     .toString(),
                        //     style: TextStyle(color: Colors.black),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.red,
                        ),
                        Container(
                          width: size.width * 0.3,
                          child: Text(
                            "Rate",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: size.width * 0.1,
                          child: Text(":"),
                        ),
                        Text(
                          value.productInfoList != null &&
                                  value.productInfoList!.length > 0
                              ? "\u{20B9}" +
                                  " " +
                                  value.productInfoList![0].s_rate!
                              : "",
                          // " ${value.productInfoList![index].s_rate!}",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                      children: [
                        Icon(
                          Icons.square_foot,
                          color: Colors.red,
                        ),
                        // SizedBox(
                        //   width: size.width * 0.01,
                        // ),
                        Container(
                          width: size.width * 0.3,
                          child: Text(
                            "Available Sizes",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: size.width * 0.09,
                          child: Text(" :"),
                        ),
                        getSizewidget(value.sizeList!),
                      ],
                    ),
                    //  Container(
                    //    height: 400,
                    //       // width: size.width * 0.5,
                    //      child: ListView.builder(
                    //        scrollDirection: Axis.horizontal,
                    //        itemCount: 3,
                    //        itemBuilder: (context, index) {
                    //        return Text("hhhh");
                    //      },),
                    //     ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        value.colorList!.length > 4
                            ? Container(
                                alignment: Alignment.topRight,
                                // color: Colors.red,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.red,
                                ))
                            : Container(),
                        // Container(
                        //   width: size.width * 0.4,
                        //   child: Text(
                        //     "Available Colors",
                        //     style: TextStyle(
                        //       fontSize: 17,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Container(
                      height: size.height * 0.4,
                      child: Scrollbar(
                        child: ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: value.colorList!.length,
                          itemBuilder: (context, indexlisview) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected =
                                      value.colorList![indexlisview].colorId!;
                                  print("gfvghhj${selected}");
                                  batch_code =
                                      value.colorList![indexlisview].batchCode!;
                                  // _current = index;
                                  // _buttonCarouselController.animateToPage(_current);
                                  isAutoPlayEnabled = !isAutoPlayEnabled;
                                  // _buttonCarouselController.stopAutoPlay();
                                  print('I HAVE SELECTED $selected');
                                });
                                Provider.of<Controller>(context, listen: false)
                                    .productDetails(
                                        value.productInfoList![0].product_code!,
                                        batch_code,
                                        selected,
                                        context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: value.colorList!.isNotEmpty &&
                                        value.colorList != null &&
                                        value.colorList![indexlisview]
                                                .piFiles !=
                                            null
                                    ? Column(
                                        children: [
                                          // FadeInImage(
                                          //   placeholder: NetworkImage(
                                          //       "https://miro.medium.com/max/880/0*H3jZONKqRuAAeHnG.jpg"),
                                          //   image: NetworkImage(imageurl +
                                          //       value.colorList![indexlisview]
                                          //           .piFiles!),
                                          // ),

                                          Container(
                                            width: size.width * 0.2,
                                            height: size.height * 0.1,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(imageurl +
                                                    value
                                                        .colorList![
                                                            indexlisview]
                                                        .piFiles!),
                                              ),
                                              shape: BoxShape.circle,
                                              border: selected ==
                                                      value
                                                          .colorList![
                                                              indexlisview]
                                                          .colorId!
                                                  ? Border.all(
                                                      color: Colors.red,
                                                      width: 4)
                                                  : Border.all(
                                                      color: Colors.grey),
                                            ),
                                          ),
                                          Container(
                                            child: Text(value
                                                .colorList![indexlisview]
                                                .colorName
                                                .toString()),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Container(
                                            width: size.width * 0.2,
                                            height: size.height * 0.1,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: RichText(
                                                textAlign: TextAlign.end,
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(
                                                  text: "No image",
                                                  // value
                                                  //     .colorList![indexlisview]
                                                  //     .colorName!
                                                  //     .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(value
                                                    .colorList![indexlisview]
                                                    .colorName
                                                    .toString()
                                                // value.colorList![indexlisview]
                                                //     .colorName
                                                //     .toString(),
                                                ),
                                          ),
                                        ],
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getSizewidget(List<AvailableSize> strings) {
    print(strings);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: strings
            .map(
              (size) => InkWell(
                onTap: () {
                  setState(() {
                    selctedSize = size.m_name!;
                  });
                },
                child: Text(
                  " ${size.m_name}",
                  // overflow: TextOverflow.ellipsis,
                  // maxLines: 2,
                  style: TextStyle(
                    color:
                        selctedSize == size.m_name ? Colors.red : Colors.black,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
