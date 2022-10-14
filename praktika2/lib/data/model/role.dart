
import 'package:praktika2/domain/entity/role_entity.dart';

class Role extends RoleEntity{
late int id;
final String role;

  Role({required this.id,required this.role}) :super(id:id,role : role);

  Map<String, dynamic> toMap(){
    return {'role':role};
  }

  factory Role.toFromMap(Map<String, dynamic> json)
  {
    return Role(id: json ['id'],role: json ['role']);
  }
}