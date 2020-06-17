import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'exchangeModel.dart';
import 'coin_data.dart';

const String mainUrl = 'https://rest.coinapi.io/v1/exchangerate';
const String apiKey = '?apikey=21B96582-0B85-41E7-9D3B-5141089F9D2F';

class NetworkHelper {
  Future<void> getData(
      String currency, Function(List<ExchangeModel>) callback) async {
    List<ExchangeModel> list = [];
    for (String crypto in cryptoList) {
      var response = await http.get('$mainUrl/$crypto/$currency$apiKey');

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);

        ExchangeModel exchangeModel = ExchangeModel.fromJson(jsonResponse);
        list.add(exchangeModel);
        print(exchangeModel.time);
      }
    }
    return callback(list);
  }
}
