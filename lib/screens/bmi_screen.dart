import 'package:first_flutter_app/functions/bmi_functions.dart';
import 'package:first_flutter_app/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('Fitness App')),
      drawer: const MenuDrawer(),
      // make it to a singleChildScrollView so the screen orientation doesnt effect
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
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
              ),
            ),
          ),
        ),
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
