import 'dart:math' as math;

class BmiFunctions{
  double countBmiMetric(int height, int weight){
    final double heightMeter = height/100;
    return weight/(math.pow(heightMeter, 2));

  }
  double countBmiImperial(int height, int weight){
    return (weight/2.205)/(math.pow(height/39.37, 2));

  }
}