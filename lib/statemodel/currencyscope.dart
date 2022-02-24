import 'package:scoped_model/scoped_model.dart';

import '../data/repository.dart';
import '../helper/toast.dart';
import '../model/currency.dart';

class CurrencyScope extends Model{

  String dropdown1Value = 'EUR';
  String dropdown2Value = 'EUR';
  var mxn;
  var usd;
  var cad;
  var eur;
  var pln;
  var aud;
  var mTimeStamp;
  var mBase;
  var mDate;
  var mRate;
  bool update = false;
  Currency model;
  var repo = ApiRepository();
  List<dynamic> mxnList = List.filled(0, "", growable: true);
  List<dynamic> usdList = List.filled(0, "", growable: true);
  List<dynamic> cadList = List.filled(0, "", growable: true);
  List<dynamic> eurList = List.filled(0, "", growable: true);
  List<dynamic> plnList = List.filled(0, "", growable: true);
  List<dynamic> audList = List.filled(0, "", growable: true);

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

   Currency getCurrency(){
      return model;
   }

   String value2(){
    return dropdown2Value;
   }
  void setData(var base) async{
    update = true;
    notifyListeners();
    try {
      await repo.getGBP(base)
          .then((value) {
        model = value;
        mRate = value.mRates;
        mTimeStamp = value.mTimeStamp;
        mDate = value.mDate;
        Currency values = Currency.fromRates(mRate);
        mxn = values.getMXN();
        usd = values.getUSD();
        aud = values.getAUD();
        pln = values.getPLN();
        eur = values.getEUR();
        cad = values.getCAD();
        //print('From currencyscope ${values.getMXN()}');
        //print('From currencyscope ${value.mRates}');
        //print('From currencyscope ${value.mTimeStamp}');
        update = false;
        Toast1().showToast('Successfull!');
        notifyListeners();
      });
    }catch(e){
      print('Error occured at setData scopemodel ${e}');
      update = false;
      if(base == 'EUR')
      Toast1().showToast('Oops! Exception occurred here');
      else
        Toast1().showToast('Subscribe to perform this conversion!!');
      notifyListeners();
      //repo.;
    }
  }

  void getHistory(base) async{
    int j = 5;
    try {
      for (int i = 0; i < 5; i++) {
        await repo.getHistory('2020-03-${j--}', base)
            .then((value) {
          mRate = value.mRates;
          mTimeStamp = value.mTimeStamp;
          mDate = value.mDate;
          Currency values = Currency.fromRates(mRate);
          mxn = values.getMXN();
          usd = values.getUSD();
          aud = values.getAUD();
          pln = values.getPLN();
          eur = values.getEUR();
          cad = values.getCAD();
          mxnList.add(mxn);
          usdList.add(usd);
          audList.add(aud);
          plnList.add(pln);
          eurList.add(eur);
          notifyListeners();
        });
      }
    }catch(e){
      print('Error occured at getHistory scopemodel ${e}');
    }
  }

}