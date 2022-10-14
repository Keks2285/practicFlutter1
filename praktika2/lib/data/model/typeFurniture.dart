import 'package:praktika2/domain/entity/typeFurniture_entity.dart';

class TypeFurniture extends TypeFurnitureEntity
{
late int id;
final String name;

  TypeFurniture({required this.id,required this.name}) :super(id:id,name : name);
  
  Map<String, dynamic> toMap(){
    return {'name':name};
  }

  factory TypeFurniture.toFromMap(Map<String, dynamic> json)
  {
    return TypeFurniture(id: json ['id'],name: json ['name']);
  }
}