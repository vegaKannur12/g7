// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:g7/screen/color_ticker.dart';

// class DetailsPage extends StatefulWidget {
//   // final String url;
//   // final String title;
//   // final int index;
//   // DetailsPage({this.url, this.title, this.index});

//   @override
//   _DetailsPageState createState() => _DetailsPageState();
// }

// class _DetailsPageState extends State<DetailsPage> {

//   int _current = 0;
//   String selected = "grey";

//   List<T> map<T>(List list, Function handler) {
//     List<T> result = [];
//     for (var i = 0; i < list.length; i++) {
//       result.add(handler(i, list[i]));
//     }
//     return result;
//   }

//   final CarouselController _buttonCarouselController = CarouselController();


//   @override
//   Widget build(BuildContext context) {   
//     return Scaffold(
//         backgroundColor: Theme.of(context).canvasColor,
//         appBar: AppBar(
//             title: Center(
//               child: Text(
//                 'Details',
//                 style: TextStyle(
//                     fontFamily: 'OpenSansLight',
//                     fontSize: 26,
//                     // color: Theme.of(context).textTheme.headline1.color
//                     ),
//               ),
//             ),),
         
//         body: ListView(
//                     children: <Widget>[
//                      //Carousel Slider
//                       CarouselSlider.builder(
//                         carouselController: _buttonCarouselController,
//                           options: CarouselOptions(
                              
//                               height: 200.0,
//                               enlargeCenterPage: true,
//                               enlargeStrategy: CenterPageEnlargeStrategy.height,
//                               initialPage: 0,
//                               reverse: false,
//                               autoPlay: false,
//                               enableInfiniteScroll: false,
//                               scrollDirection: Axis.horizontal,
//                               onPageChanged: (index, fn) {
//                                 setState(() {
//                                   _current = index;
//                                 });
//                               }),
//                           itemCount: imgList.length,
//                           itemBuilder: (BuildContext context, int index,_) =>
//                               Builder(builder: (BuildContext context) {
//                             return Image.network(
//                               imgList[index],
//                               fit: BoxFit.contain,
//                             );
//                           }),
                        
//                       ),
//                       SizedBox(height: 10),
//                      //Indicator to show current index of images
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: map<Widget>(imgList, (index, url) {
//                           return Container(
//                             width: 30.0,
//                             height: 2.0,
//                             margin: EdgeInsets.symmetric(
//                                 vertical: 10.0, horizontal: 4.0),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(10.0),
//                               color: _current == index
//                                   ? Colors.deepPurple
//                                   : Colors.grey,
//                             ),
//                           );
//                         }),
//                       ),
//                     Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: 30,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text('Color',
//                                   style: TextStyle(
//                                       fontFamily: 'OpenSansLight',
//                                       fontSize: 24)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Flexible(
//                         fit: FlexFit.loose,
//                         child: Container(
//                           width: 100,
//                           height: 120,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: imgList.length,
//                             itemBuilder: (BuildContext context, int index) {
//                              //Color selector from images to manually control the carousel 
//                              return GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     selected = imgList[index];
//                                     _current = index;
//                                     _buttonCarouselController
//                                         .animateToPage(_current);
//                                     print('I HAVE SELECTED $selected');
//                                   });
//                                 },
//                                 child: ColorTicker(
//                                   image: imgList[index],
//                                   selected: imgList[index],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ), 
//                      ],
//                     ),
//                    );}}