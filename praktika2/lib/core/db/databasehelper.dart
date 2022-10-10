import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:praktika2/common/databaserequest.dart';
import 'package:praktika2/data/model/role.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';


///
class DataBaseHelper{
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;

  late final String _pathDB;
  late final Database database;
Future<void> init() async
{
    _appDocumentDirectory =  await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory!.path, 'IKEA.db');
    if(Platform.isLinux|| Platform.isMacOS|| Platform.isWindows){
    }
    else{
        database = await openDatabase(
          _pathDB,
           version: 1,
           onCreate:(db, version){
            onCreateTable(db);
           },
           onUpgrade: ((db, oldVersion, newVersion) async
           {
            await onUpdateTable(db);
           })
           );
    };
}

Future<void> onUpdateTable(Database db) async {
var table = await db.rawQuery('SELECT name FROM sqlite_master');
for (var i = 0; i < DataBaseRequest.tableList.reversed.length; i++) {
if (table.where((element) => element['name'] == DataBaseRequest.tableList[i]).isNotEmpty) {
await db.execute(DataBaseRequest.deleteTable(DataBaseRequest.tableList[i]));
}
}
for (var element in DataBaseRequest.tableCreateList) {
await db.execute(element);
}
await onInitTable(db);
}

Future<void> onCreateTable(Database db) async {
  for (var i=0; i < DataBaseRequest.tableList.length; i++)
  {
    db.execute(DataBaseRequest .tableCreateList[i]);
  }
}
Future<void> onInitTable(Database db)async {
  try { 
    db.insert(DataBaseRequest.tableRole, Role(role: 'Администратор').toMap());
    db.insert(DataBaseRequest.tableRole, Role(role: 'Пользователя').toMap());
      
  } on DatabaseException  catch (e){
    print(e.getResultCode());
    
  }
}




 Future<void> onDropDataBase() async{
  database.close();
  if(Platform.isLinux|| Platform.isMacOS|| Platform.isWindows){

  } else{
    deleteDatabase(_pathDB);
  }

 }
}

