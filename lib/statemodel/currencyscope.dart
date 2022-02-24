import 'package:scoped_model/scoped_model.dart';

class CurrencyScope extends Model{

  String dropdown1Value = 'EUR';
  String dropdown2Value = 'EUR';

void changeValue1(String value){
  dropdown1Value = value;
  notifyListeners();
}

   void changeValue2(String value){
  dropdown2Value = value;
  notifyListeners();
   }

   String value1(){
    return dropdown1Value;
   }

   String value2(){
    return dropdown2Value;
   }
}