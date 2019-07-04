import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBCreator {
  static const String TABLE_NAME = 'Subject';
  static const String ID = 'id';
  static const String TITLE = 'title';
  static const String TYPE = 'type';
  static const String ROOM = 'room';
  static const String PRIORITY = 'priority';
  static const String DESCRIPTION = 'description';
  static const String HOURS_WEEK = 'hoursWeek';
  static const String COLOR_ALPHA = 'color_alpha';
  static const String COLOR_RED = 'color_red';
  static const String COLOR_GREEN = 'color_green';
  static const String COLOR_BLUE = 'color_blue';
  static const String STARTED_TIMETRACKING_AT = 'started_timetracking_at';
  static const String TIME_SPENT = 'time_spent';
  static const String DUE_DATE = 'due_date';
  static const String DATE_OF_CREATION = 'date_of_creation';

  static DBCreator _databaseCreator; // Singleton DatabaseHelper
  static Database _database; //Singleton Database

  DBCreator._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DBCreator() {
    if (_databaseCreator == null) {
      _databaseCreator = DBCreator
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseCreator;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + '/subject_36.db';
    var db = await openDatabase(path, version: 1, onCreate: createDB);
    return db;
  }

  void createDB(Database db, int version) async {
    // Create Table
    await db.execute(
        'CREATE TABLE $TABLE_NAME($ID INTEGER PRIMARY KEY AUTOINCREMENT, '
        ' $TITLE TEXT, $TYPE TEXT, $ROOM TEXT,'
        ' $PRIORITY TEXT,'
        ' $DESCRIPTION TEXT,'
        ' $HOURS_WEEK INTEGER,'
        ' $COLOR_ALPHA INTEGER,'
        ' $COLOR_RED INTEGER,'
        ' $COLOR_GREEN INTEGER,'
        ' $COLOR_BLUE INTEGER,'
        ' $STARTED_TIMETRACKING_AT TEXT,'
        ' $DUE_DATE TEXT,'
        ' $TIME_SPENT INTEGER,'
        ' $DATE_OF_CREATION TEXT);');
  }
}
