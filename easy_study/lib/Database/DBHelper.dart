
import 'dart:async';
import 'dart:io' as io;
import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/model/Type.dart';
import 'package:easy_study/model/Priority.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  final String TABLE_NAME = 'Subject';
  final String ID = 'id';
  final String TITLE = 'title';
  final String TYPE  = 'type';
  final String ROOM  = 'room';
  final String PRIORITY  = 'priority';
  final String DESCRIPTION  = 'description';
  final String HOURSWEEK = 'hoursWeek';

  static DBHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database;           //Singleton Database


  DBHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DBHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DBHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if(_database == null) {
      _database = await initDB();
    }
      return _database;

  }

  Future<Database> initDB() async {

    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + '/subject_three.db';
    var db = await openDatabase(path,version: 1,onCreate: _createDB);
    return db;
  }


  void _createDB(Database db, int version) async{
    // Create Table
    await db.execute('CREATE TABLE $TABLE_NAME($ID INTEGER PRIMARY KEY AUTOINCREMENT, '
        ' $TITLE TEXT, $TYPE TEXT, $ROOM TEXT,'
        ' $PRIORITY TEXT,'
        ' $DESCRIPTION TEXT,'
        ' $HOURSWEEK INTEGER);');

  }

  /*
  CRUD Function
   */

  Future<List<Subject>> getSubjects() async {
    Database db_connection = await this.database;
    List<Map> list = await db_connection.query(TABLE_NAME);
    List<Subject> subjects = new List();
    for(int index = 0; index < list.length; index++){
      Subject subject = new Subject.name(
        list[index]['title'],
        Type.getType(list[index]['type']),
        list[index]['room'],
        Priority.getPriority(list[index]['priority']),
        list[index]['description'],
        list[index]['hoursWeek'],
      );
      subject.id = list[index]['id'];
      subjects.add(subject);
    }

    return subjects;
  }

  Future<int> addNewSubject(Subject subject) async {
    var db_connection = await this.database;
    var result = await db_connection.insert(TABLE_NAME, subject.toMap());
    return result;
  }

  Future<int> updateSubject(Subject subject) async {
    var db_connection = await this.database;
    var result = await db_connection.update(TABLE_NAME, subject.toMap(),where: '$ID = ?',whereArgs: [subject.id]);
    return result;
  }


  Future<int> deleteSubject(int id) async {
    var db_connection = await this.database;
    var result = await db_connection.delete(TABLE_NAME,where: '$ID = ?',whereArgs: [id]);
    return result;
  }
}