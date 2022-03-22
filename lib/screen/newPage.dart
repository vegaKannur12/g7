// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:zoqa/screen/bottom_navigation.dart';
// import 'package:zoqa/service/buttonClass.dart';

// class ExpandedWidget extends StatefulWidget {
//   @override
//   State<ExpandedWidget> createState() => _ExpandedWidgetState();
// }

// class _ExpandedWidgetState extends State<ExpandedWidget> {
//   List<ButtonClass> buttons = [
//     ButtonClass(name: "black", color: Colors.black),
//     ButtonClass(name: "blue", color: Colors.blue),
//     ButtonClass(name: "white", color: Colors.white),
//     ButtonClass(name: "red", color: Colors.red),
//     ButtonClass(name: "orange", color: Colors.orange),
//     ButtonClass(name: "green", color: Colors.green),
//   ];
//   List filteroption = ["Available Colors", "Available Sizes"];
//   List? size = ["xl", "xxl", "s"];
//   Color? selection;

//   String buttonclick = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back_ios_new)),
//       ),
//       body: ListView.builder(
//         itemCount: filteroption.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ExpansionTile(
//               title: Text(filteroption[index]),
//               children: [
//                 if (filteroption[index] == "Available Colors")
//                   Container(
//                     height: 150,
//                     child: gridview(buttons, null),
//                   )
//                 else if (filteroption[index] == "Available Sizes")
//                   Container(
//                     height: 150,
//                     child: gridview(null, size),
//                   )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget gridview(List<ButtonClass>? buttonclass, List? sizelist) {
//     return GridView.builder(
//       shrinkWrap: true,
//       itemCount: sizelist == null ? buttonclass!.length : sizelist.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         // crossAxisSpacing: 5,
//         // mainAxisSpacing: 5,
//         mainAxisExtent: 50,
//       ),
//       itemBuilder: sizelist == null
//           ? (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 50,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: selection == buttons[index].color
//                             ? selection
//                             : null,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           selection = buttons[index].color!;
//                         });
//                       },
//                       child: Text(buttons[index].name!)),
//                 ),
//               );
//             }
//           : (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 50,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           // selection = buttons[index].color!;
//                         });
//                       },
//                       child: Text(sizelist[index]!)),
//                 ),
//               );
//             },
//     );
//   }
// }
