// import 'package:flutter/material.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({Key? key}) : super(key: key);

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Bottom Navigation bar")),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.filter),
//             label: 'Filter',
            
//           ),
//         ],
//       ),
//     );
// //   }
  
// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });

// //     // Widget callPage()
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:zoqa/screen/category.dart';
// import 'package:zoqa/screen/newPage.dart';

// class Bottombar extends StatefulWidget {
//   @override
//   _BottombarState createState() => _BottombarState();
// }

// class _BottombarState extends State<Bottombar> {
//   int selectedindex = 0;
//   static const List<Widget> options = <Widget>[
    
//   ];
//   void ontapItem(int index){
//     setState(() {
//       selectedindex = index;
//       //print(selectedindex);
//       if(selectedindex == 0){
//         Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                   builder: (context) => Category(),
//                 ),
//         );
//       }
//       else if(selectedindex==1){
//         Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                   builder: (context) => ExpandedWidget(),
//                 ),
//         );

//       } 
//     },);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_box),
//             label: 'Filter',
//           ),
//         ],
//         currentIndex:selectedindex ,
//         selectedItemColor: Colors.green[700],
//         onTap: ontapItem,
//       ),
//     );
//   }
// }