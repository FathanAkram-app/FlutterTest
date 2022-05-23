import 'dart:math' as math;

class BmiFunctions{
  double countBmiMetric(int height, int weight){
    return weight/(math.pow(height/100, 2));

  }
  double countBmiImperial(int height, int weight){
    return (weight/2.205)/(math.pow(height/39.37, 2));

  }
}