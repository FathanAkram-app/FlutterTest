
import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int index){
          switch (index) {
            case 0:
              // Navigator.pushNamed(context,'/');
              break;
            case 1:

              // Navigator.pushNamed(context,'/bmi');
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black12
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check,
              color: Colors.black12,
              
            ),
            label: 'Calculate'
          ),
          
        
          
        ],
      );
  }
}