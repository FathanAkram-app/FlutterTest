import 'dart:math' as math;

class BmiFunctions{
  double countBmiMetric(int height, int weight){
    final double heightMeter = height/100;
    return weight/(math.pow(heightMeter, 2));

  }
  double countBmiImperial(int height, int weight){
    final double heightMeter = height/100;
    return weight*703/(math.pow(heightMeter, 2));

  }
}