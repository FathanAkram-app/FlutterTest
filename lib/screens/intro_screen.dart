import 'package:first_flutter_app/shared/menu_bottom.dart';
import 'package:first_flutter_app/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Globe Fitness')),
        drawer: const MenuDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage(''),
            //     fit: BoxFit.cover
            // )
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.grey
                  )
                ]
              ),
              child: const Text(
                'Commit to be fit, dare to be great with this App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:22,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Colors.grey
                    )
                  ]
                ),)
            )
          )
        ),
      );
  }
}