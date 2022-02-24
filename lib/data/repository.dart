import 'dart:convert';

import '../model/currency.dart';
import 'api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiRepository {

  ApiRepository();

  Future<void> getGBP(eur) async {
    print('Getting from server');
    var queryParameters = {
      'access_key': API.ACCESS_KEY,
      'base': eur,
      'symbols': '${API.MXN},${API.USD}'
    };

    var uri =
    Uri.http('${API.BASE_URL}', API.LATEST, queryParameters);

    Response res = await http.get(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },);

    if (res.statusCode == 200) {
      print(res.statusCode);
      print('getEur ${res.body}');
    } else {
      print(res.statusCode);
      print('getEur ${res.body}');
    }

    try{
      Currency.fromOject(jsonDecode(res.body));
    }catch(e){

    }
  }
}

