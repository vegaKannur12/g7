import 'dart:io';

import 'package:flutter/services.dart';
import 'package:g7/screen/base.dart';
import 'package:g7/screen/category.dart';
import 'package:g7/screen/product_details.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: MyApp(),
    ),
  );
  // });
  // HttpOverrides.global = MyHttpOverrides();
}
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//         ..maxConnectionsPerHost = 5;
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'productdetailspage': (BuildContext context) => ProductDetails(),
      },
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Color.fromARGB(255, 236, 173, 178),
        primarySwatch: Colors.red,
        //  brightness: Brightness.dark,
        //  fontFamily: 'Georgia',

        // textTheme:  TextTheme(
        //   headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(
        //     fontSize: 25.0,
        //   ),
        //   bodyText2: TextStyle(
        //     fontSize: 14.0,
        //   ),
        // ),
      ),
      home: Base(batchname: ""),
      debugShowCheckedModeBanner: false,
    );
  }
}
