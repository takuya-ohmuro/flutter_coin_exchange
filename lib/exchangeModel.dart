class ExchangeModel {
  ExchangeModel({this.time, this.assetIdBase, this.assetIdQuote, this.rate});

  String time;
  String assetIdBase;
  String assetIdQuote;
  double rate = 0.0;

  ExchangeModel.fromJson(Map<String, dynamic> json)
      : time = json['time'],
        assetIdBase = json['asset_id_base'],
        assetIdQuote = json['asset_id_quote'],
        rate = json['rate'];
}
