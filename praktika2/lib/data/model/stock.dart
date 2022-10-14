
import 'package:praktika2/domain/entity/stock_entity.dart';

class Stock extends StockEntity
{
late int id;
final String adres;

  Stock({required this.id,required this.adres}) :super(id:id,adres : adres);
  
  Map<String, dynamic> toMap(){
    return {'adres':adres};
  }

  factory Stock.toFromMap(Map<String, dynamic> json)
  {
    return Stock(id: json ['id'],adres: json ['adres']);
  }
}