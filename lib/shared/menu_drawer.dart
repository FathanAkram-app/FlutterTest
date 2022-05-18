import 'package:first_flutter_app/screens/bmi_screen.dart';
import 'package:first_flutter_app/screens/intro_screen.dart';
import 'package:flutter/material.dart';


class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context){
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training'
    ];
    List<Widget> menuItems = [];
    menuItems.add(
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          'Globo Fitness',
          style: TextStyle(fontSize: 28,color: Colors.white),
        )
      )
    );
    for (var element in menuTitles) {
      Widget screens = Container();
      menuItems.add(ListTile(
        title: Text(
          element,
          style: const TextStyle(color: Colors.black,fontSize: 18),
        ),
        onTap: (){
          switch (element) {
            case 'Home':
              screens = const IntroScreen();
              break;
            case 'BMI Calculator':
              screens = const BmiScreen();
              break;
            default:
          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screens)
          );
        },
      ));
    }
    return menuItems;
  }
}