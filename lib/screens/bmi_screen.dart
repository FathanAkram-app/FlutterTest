import 'package:first_flutter_app/functions/bmi_functions.dart';
import 'package:first_flutter_app/shared/menu_bottom.dart';
import 'package:first_flutter_app/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math' as math;

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> with BmiFunctions{
  double result = 0;
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  bool isMetric = true;
  bool isImperial = false;
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isMetric,isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ToggleButtons(
            isSelected: isSelected,
            onPressed: toggleMeasure,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Metric',style: TextStyle(fontSize: 18),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Imperial',style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
          Row(children: [Text('Height ${((isMetric) ? "(cm)" : "(inches)")}')]),
          TextField(
            controller: height,
          ),
          Row(children: [Text('Weight ${((isMetric) ? "(kg)" : "(pounds)")}')]),
          TextField(
            controller: weight,
          ),
          Text('Result : $result'),
          ElevatedButton(
            onPressed: setResult, 
            child: const Text('Count')
          )
        ],
      ),
    ); 
  }

  void setResult(){
    setState(() {
      result = (isMetric) ? countBmiMetric(int.parse(height.text),int.parse(weight.text)): countBmiImperial(int.parse(height.text),int.parse(weight.text));
    });
  }

  

  void toggleMeasure(value){
    if(value==0){
      isMetric = true;
      isImperial = false;
    }else{
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
}
