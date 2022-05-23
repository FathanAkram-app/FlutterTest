
import 'package:first_flutter_app/screens/bmi_screen.dart';
import 'package:first_flutter_app/screens/intro_screen.dart';
import 'package:first_flutter_app/screens/news_screen.dart';
import 'package:first_flutter_app/screens/shop_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': ((context) => const IntroScreen()),
        '/bmi': ((context) => const BmiScreen()),
        '/news':(context) => const NewsScreen(),
        '/shop':(context) => const ShopScreen(),
        

      },
      initialRoute: '/',
    );
  }
}