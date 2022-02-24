class Currency{

var mTimeStamp;
var mBase;
var mDate;
var mRates;
var mxn;
var usd;
var cad;
var aud;
var pln;
var eur;
var error;
var success;
var code;


Currency({this.mTimeStamp,this.mBase,this.mDate,this.mxn,this.usd,this.eur,this.pln,this.aud,this.cad});

Currency.fromOject(dynamic o) {
  this.mTimeStamp = o["timestamp"];
  this.mBase = o["base"];
  this.mDate = o["date"];
  this.mRates = o["rates"];
  this.error = o["error"];
  print(mTimeStamp);
  print(mBase);
  print(mDate);
  print(mRates);
  Currency.fromRates(mRates);
  }

Currency.fromErrors(dynamic o){
  this?.error = o['error'];
  this?.success = o['success'];
  this?.code = this.error['code'];
  print(error);
  print(success);
  print(code);
}

  Currency.fromRates(dynamic o){
    this.mxn = o["MXN"];
    this.usd = o["USD"];
    this.eur = o["EUR"];
    this.aud = o["AUD"];
    this.cad = o["CAD"];
    this.pln = o["PLN"];
    print(mxn);
    print(eur);
    print(usd);
    print(aud);
    print(cad);
    print(pln);
  }
  dynamic getMXN(){
   return mxn;
  }

  dynamic getUSD(){
  return usd;
  }

  dynamic getEUR(){
    return eur;
  }

 dynamic getAUD(){
  return aud;
}

dynamic getError(){
  return error;
}

 dynamic getCAD(){
  return cad;
}

  dynamic getPLN(){
   return pln;
  }

  String getTimeStamp(){
     return mTimeStamp;
  }

  String getDate(){
    return mDate;
  }

  String getBase(){
    return mBase;
  }

  String getRate(){
     return mRates;
  }

}