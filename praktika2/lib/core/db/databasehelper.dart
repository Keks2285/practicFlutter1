import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:praktika2/common/databaserequest.dart';
import 'package:praktika2/data/model/role.dart';
import 'package:praktika2/data/model/typeFurniture.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

///
class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;

  late final String _pathDB;
  late final Database database;
  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory!.path, 'IKEA.db');
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {

      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      database= await databaseFactory.openDatabase(_pathDB,   
        options: OpenDatabaseOptions(
             version: 1,
             onCreate: (db, version) {onCreateTable(db);},
             onUpgrade: ((db, oldVersion, newVersion) async {await onUpdateTable(db);})
          ));


    } else {
      database =
          await openDatabase(_pathDB, version: 1, onCreate: (db, version) {
        onCreateTable(db);
      }, onUpgrade: ((db, oldVersion, newVersion) async {
        await onUpdateTable(db);
      }));
    }
    ;
  }

  Future<void> onUpdateTable(Database db) async {
    var table = await db.rawQuery('SELECT name FROM sqlite_master');
    for (var i = 0; i < DataBaseRequest.tableList.reversed.length; i++) {
      if (table
          .where((element) => element['name'] == DataBaseRequest.tableList[i])
          .isNotEmpty) {
        await db
            .execute(DataBaseRequest.deleteTable(DataBaseRequest.tableList[i]));
      }
    }
    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }
    await onInitTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      db.execute(DataBaseRequest.tableCreateList[i]);
    }
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole, Role(id:1,role: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(id:2,role: 'Пользователя').toMap());
      db.insert(DataBaseRequest.tableTypeFurniture, TypeFurniture(id:1,name: 'Стол').toMap());
      db.insert(DataBaseRequest.tableTypeFurniture, TypeFurniture(id:2,name: 'Стул').toMap());
      db.insert(DataBaseRequest.tableTypeFurniture, TypeFurniture(id:3,name: 'Диван').toMap());
    } on DatabaseException catch (e) {
      print(e.getResultCode());
    }
  }

  Future<void> onDropDataBase() async {
    database.close();
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    databaseFactory = databaseFactoryFfi; 
    databaseFactory.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
