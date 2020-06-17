import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'exchangeModel.dart';

const String mainUrl =
    'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=21B96582-0B85-41E7-9D3B-5141089F9D2F';

class NetworkHelper {
  Future<void> getData(Function(ExchangeModel) callback) async {
    var response = await http.get(mainUrl);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      ExchangeModel exchangeModel = ExchangeModel.fromJson(jsonResponse);
      return callback(exchangeModel);
    }
  }
}
