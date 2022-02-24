class Currency{

var mTimeStamp;
var mBase;
var mDate;
var mRates;
var mxn;
var usd;
var eur;
var jpy;


Currency.fromOject(dynamic o) {
  this.mTimeStamp = o["timestamp"];
  this.mBase = o["base"];
  this.mDate = o["date"];
  this.mRates = o["rates"];
  print(mTimeStamp);
  print(mBase);
  print(mDate);
  print(mRates);
  Currency.fromRates(mRates);
  }

  Currency.fromRates(dynamic o){
    this.mxn = o["MXN"];
    this.usd = o["USD"];
    this.eur = o["EUR"];
    this.jpy = o["JPY"];
    print(mxn);
    print(eur);
    print(usd);
    print(jpy);
  }
}