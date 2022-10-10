///Запросы к БД
abstract class DataBaseRequest{
  static const String tableRole = 'Role';

  /// Таблица Пользователи
  ///
  /// Поля таблицы: Логин, Пароль, Роль
  
  static String deleteTable(String table)=>'DROP TABLE $table';

  static const String tableUsers = 'Users';
  static const String tableProvider = 'Provider';
  static const String tableTypeFurniture = "Type_Furniture";
  static const String tableFurniture="Furniture";
  static const List<String> tableList =[
    tableRole,
    tableUsers,
    tableProvider,
    tableTypeFurniture,
    tableFurniture
  ];
    static const List<String> tableCreateList =[
    _createTableRole,
    _createTableUsers,
    _createTableProvider,
    _createTableFurniture,
    _createTableTypeFurniture
  ];
  static const String _createTableRole =
  'CREATE TABLE "$tableRole" ("id" INTEGER  PRIMARY KEY,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT));';
  /// Запрос для создания таблицы Users

  static const String _createTableUsers =
  'CREATE TABLE "$tableUsers" ("id" INTEGER  PRIMARY KEY,"login" TEXT NOT NULL UNIQUE,"password" TEXT NOT NULL, "first_name" TEXT NOT NULL, "last_name" TEXT NOT NULL, "middle_name" TEXT ,"id_role" INTEGER,FOREIGN KEY("id_role") REFERENCES "$tableProvider"("id"),PRIMARY KEY("id"));';

  static const String _createTableProvider=
  'CREATE TABLE "$tableProvider"( "id" INTEGER PRIMARY KEY, "name" TEXT NOT NULL UNIQUE, "adres" TEXT NOT NULL, "email" TEXT NOT NULL UNIQUE);';
  
  static const String _createTableTypeFurniture= 
  'CREATE TABLE "$tableTypeFurniture"( "id" INTEGER PRIMARY KEY, "name" TEXT NOT NULL UNIQUE);';

  static const String _createTableFurniture =
   'CREATE TABLE "$tableFurniture" ("id" INTEGER PRIMARY KEY,"name" TEXT NOT NULL UNIQUE, "price" REAL NOT NULL, "id_provider" INTEGER, "id_type" INTEGER, FOREIGN KEY("id_provider") REFERENCES "$tableProvider"("id"), FOREIGN KEY("id_type") REFERENCES "$tableTypeFurniture"("id"));';
}