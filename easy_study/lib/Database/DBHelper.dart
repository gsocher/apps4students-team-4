
import 'dart:async';
import 'dart:io' as io;
import 'package:easy_study/model/Subject.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  //Definal
  final String TABLE_NAME = 'Subject';
  static Database _db_instance;

  Future<Database> get db async {
    if(_db_instance == null){
      _db_instance = await initDB();
      return _db_instance;
    }
  }

  initDB() async {

    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,"EDMTDev.db");
    var db = await openDatabase(path,version: 1,onCreate: onCreateFunc);
  }


  void onCreateFunc(Database db, int version) async{
    // Create Table
    await db.execute('CREATE TABLE $TABLE_NAME(title TEXT PRIMARY KEY, '
        'type TEXT,'
        'room TEXT,'
        'priority TEXT,'
        'description TEXT,'
        'hoursWeek INTEGER,'
        'timeSpent INTEGER,'
        'color TEXT,'
        'dueDate TEXT);');
    
  }

  /*
  CRUD Function
   */

  Future<List<Subject>> getSubjects() async {
    var db_connection = await db;
    List<Map> list = await db_connection.rawQuery('SELECT * FROM $TABLE_NAME');
    List<Subject> subjects = new List();
    for(int index = 0; index < list.length; index){
      Subject subject = new Subject.name(
        list[index]['title'],
        list[index]['type'],
        list[index]['room'],
        list[index]['priority'],
        list[index]['description'],
        list[index]['hoursWeek'],
      );
    }
  }

}