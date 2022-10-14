
import 'package:praktika2/domain/entity/market_entity.dart';

class Market extends MarketEntity{
late int id;
  final String adres;
  final int id_stock;

  Market({required this.id,required this.adres, required this.id_stock}) :super(id:id, adres : adres, id_stock:id_stock);

  Map<String, dynamic> toMap(){
    return {'adres':adres, 'id_stock':id_stock};
  }

  factory Market.toFromMap(Map<String, dynamic> json)
  {
    return Market(id: json ['id'],adres: json ['adres'], id_stock: json ['id_stock']);
  }
}