
import 'package:praktika2/domain/entity/provider_entity.dart';

class Provider extends ProviderEntity{
  late int id;
  final String adres;
  final String name;
  final String number;

  Provider({required this.adres, required this.name, required this.number}) :super(adres : adres, name:name, number:number);

  Map<String, dynamic> toMap(){
    return {'adres':adres, 'name':name, 'number':number};
  }

  factory Provider.toFromMap(Map<String, dynamic> json)
  {
    return Provider(adres: json ['adres'], name: json ['name'], number: json ['number'] );
  }
}