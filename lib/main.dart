import 'package:eat_ziffy/screens/FromHome/fromHome.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'screens/Home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: "Eat Ziffy", debugShowCheckedModeBanner: false,
        // initialBinding: HomeBinding(),

        getPages: [
          GetPage(
            name: "/",
            page: () => Home(),
          ),
          GetPage(
            name: "/fromHome",
            page: () => FromHome(),
          ),
        ]);
  }
}
