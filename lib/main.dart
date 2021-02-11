import 'package:datademo/pages/home_page.dart';
import 'package:datademo/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('pdp_online');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        home: HomePage(),
        routes: {
          HomePage.id:(context) =>HomePage(),
          SignUpPage.id:(context) =>SignUpPage(),
        }
    );
  }
}

