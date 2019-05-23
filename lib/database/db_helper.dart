import 'dart:async';
import 'dart:io' as io;
import 'dart:ui';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
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

  static DBHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; //Singleton Database

  DBHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DBHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DBHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + '/subject_15.db';
    var db = await openDatabase(path, version: 1, onCreate: _createDB);
    return db;
  }

  void _createDB(Database db, int version) async {
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
        ' $COLOR_BLUE INTEGER),'
        ' $STARTED_TIMETRACKING_AT TEXT,'
        ' $TIME_SPENT INTEGER);');
  }

  /*
  CRUD Function
   */

  Future<List<Subject>> getSubjects() async {
    Database dbConnection = await this.database;
    List<Map> list = await dbConnection.query(TABLE_NAME);
    List<Subject> subjects = new List();
    for (int index = 0; index < list.length; index++) {
      Subject subject = new Subject.name(
        list[index][TITLE],
        ExamType.getType(list[index][TYPE]),
        list[index][ROOM],
        Priority.getPriority(list[index][PRIORITY]),
        list[index][DESCRIPTION],
        list[index][HOURS_WEEK],
      );
      subject.id = list[index]['id'];
      subject.color = Color.fromARGB(
          list[index][COLOR_ALPHA],
          list[index][COLOR_RED],
          list[index][COLOR_GREEN],
          list[index][COLOR_BLUE]);
      subject.startedTimetrackingAt = list[index][STARTED_TIMETRACKING_AT];
      subject.timeSpent = list[index][TIME_SPENT];

      subjects.add(subject);
    }
    return subjects;
  }

  Future<int> addNewSubject(Subject subject) async {
    if (subject == null) {
      return -1;
    }
    var dbConnection = await this.database;
    var result = await dbConnection.insert(TABLE_NAME, subject.toMap());
    return result;
  }

  Future<int> updateSubject(Subject subject) async {
    if (subject == null) {
      return -1;
    }
    var dbConnection = await this.database;
    var result = await dbConnection.update(TABLE_NAME, subject.toMap(),
        where: '$ID = ?', whereArgs: [subject.id]);
    return result;
  }

  Future<int> deleteSubject(int id) async {
    var dbConnection = await this.database;
    var result = await dbConnection
        .delete(TABLE_NAME, where: '$ID = ?', whereArgs: [id]);
    return result;
  }
}
