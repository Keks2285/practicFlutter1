import 'package:praktika2/core/crypto/crypto.dart';
import 'package:praktika2/core/db/databasehelper.dart';
import 'package:praktika2/common/databaserequest.dart';
import 'package:praktika2/core/exeption/failure.dart';
import 'package:praktika2/data/model/user.dart';
import 'package:praktika2/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:praktika2/domain/repositories/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';

class AuthRepositoriesImpl implements AuthRepositories{
  


  final _db = DataBaseHelper.instance.database;
  @override
   String get table=>DataBaseRequest.tableUsers;


  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try{
      var user = await _db.query(
        table, 
        columns: ['login', 'password', 'id_role'],
        where: 'login=?', 
        whereArgs: [login]);
      if(user.isEmpty){
        return Left('Такого пользователя нет');
      }
      if(user.first['password']!=Crypto.crypto(password)){
        return Left(AuthPasswordFailure().errormessage);
      }

      return Right(RoleEnum.values[(user.first['id_role'] as int )-1]);
    } on DatabaseException catch(error){
      return Left(FailureDB(error.getResultCode()!).error.errormessage) ;
    }

  }

  @override
  Future<Either<String, bool>> signUp( String login, String password,  String firstName, String lastName, String middleName) async {
    try{
      var passHes = Crypto.crypto(password);
      _db.insert(
        table,
        User(
         login: login, 
         firstName: firstName,
          lastName: lastName,
           middleName: middleName, 
           password: passHes, 
           id_role: RoleEnum.admin.id
      ).toMap());
      //var result = await _db.rawQuery('Select  from $table order by Desc limit 1');
      return const Right(true);
    } on DatabaseException catch(error){ 
      return Left(FailureDB(error.getResultCode()!).error.errormessage);
    }
  }


}