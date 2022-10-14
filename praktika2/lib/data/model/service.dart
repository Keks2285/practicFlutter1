
import 'package:praktika2/domain/entity/service_entity.dart';

class Service extends ServiceEntity
{
late int id;
final String name;
final double price;

  Service({required this.id,required this.name, required this.price}) :super(id:id,name : name, price:price);

  Map<String, dynamic> toMap(){
    return {'name':name, 'price':price};
  }

  factory Service.toFromMap(Map<String, dynamic> json)
  {
    return Service(id: json ['id'],name: json ['name'], price: json ['price']);
  }
}