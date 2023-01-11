import 'package:flutter/material.dart';
import 'package:track_it/screens/homepage.dart';
import 'package:track_it/util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData.light().copyWith(
        primaryColor: primaryColor,
        appBarTheme:
            const AppBarTheme().copyWith(backgroundColor: primaryColor),
        floatingActionButtonTheme: const FloatingActionButtonThemeData()
            .copyWith(backgroundColor: primaryColor),
      ),
    );
  }
}
