import 'dart:convert';

import '../model/currency.dart';
import 'api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiRepository {

  ApiRepository();

  Future<Currency> getGBP(currency) async {
    print('Getting from server');
    print('${currency}');
    var queryParameters = {
      'access_key': API?.ACCESS_KEY,
      'base': currency,
      'symbols': '${API?.MXN},${API?.USD},${API?.EUR},${API?.AUD}, ${API?.PLN},${API?.CAD}'
    };

    var uri =
    Uri.http('${API?.BASE_URL}', API?.LATEST, queryParameters);

    Response res = await http.get(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },);

    if (res?.statusCode == 200) {
      print(res?.statusCode);
      print('getEur ${res.body}');
    } else {
      print(res?.statusCode);
      print('getEur ${res.body}');
    }

    try{
      var currency = Currency.fromOject(jsonDecode(res.body));
      return currency;
    }catch(e){
            print('exception occured here at repository getGBP ${e}');
            Currency.fromErrors(jsonDecode(res.body));
    }
  }

  Future<Currency> getHistory(date,currency) async {
    print('Getting from server');
    var queryParameters = {
      'access_key': API.ACCESS_KEY,
      'base': currency,
      'symbols': '${API.MXN},${API.USD},${API.EUR},${API.AUD}, ${API.PLN},${API
          .CAD}'
    };

    var uri =
    Uri.http('${API?.BASE_URL}', '${API?.HISTORY}2020-03-10', queryParameters);

    Response res = await http.get(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },);

    if (res.statusCode == 200) {
      print(res?.statusCode);
      print('getHistory ${res?.body}');
    } else {
      print(res?.statusCode);
      print('getHistory ${res?.body}');
    }

    try{
      var currency = Currency.fromOject(jsonDecode(res?.body));
      return currency;
    }catch(e){
      print('exception occured here ${e}');
    }
  }
}

