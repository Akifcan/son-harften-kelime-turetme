import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kelime_turetme/style/custom_theme.dart';
import 'package:kelime_turetme/views/home_view.dart';
import 'package:kelime_turetme/views/play/play_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      home: HomeView(),
      getPages: [
        GetPage(
            name: '/play',
            page: () => PlayView(),
            transition: Transition.leftToRightWithFade)
      ],
    );
  }
}
