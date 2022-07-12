import 'package:app_movie/pages/homePage.dart';
import 'package:app_movie/utils/UtilsColors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: UtilsColors.primary),
      ),
      //initialRoute: 'splash',
      home: HomePage(),
      // routes: {

      // },
    );
  }
}
