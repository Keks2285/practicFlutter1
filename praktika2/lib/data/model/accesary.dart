
import 'package:praktika2/domain/entity/accesary_entity.dart';

class Accessary extends AccesaryEntity{
late int id;
final String name;
final double price;
final int id_furniture;
final int id_stock;

  Accessary({required this.id,required this.name, required this.price,required this.id_furniture, required this.id_stock}) 
  :super(id:id,name : name, price:price, id_furniture:id_furniture, id_stock:id_stock);

  Map<String, dynamic> toMap(){
    return {'name':name, 'price':price, 'id_furniture':id_furniture, 'id_stock':id_stock, };
  }

  factory Accessary.toFromMap(Map<String, dynamic> json)
  {
    return Accessary(id: json ['id'],name: json ['name'], price: json ['price'], id_furniture: json ['id_furniture'], id_stock: json ['id_stock']);
  }
}