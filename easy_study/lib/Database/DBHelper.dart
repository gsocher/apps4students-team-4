
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
    return db;
  }


  void onCreateFunc(Database db, int version) async{
    // Create Table
    await db.execute('CREATE TABLE $TABLE_NAME(title TEXT PRIMARY KEY, '
        'type TEXT,'
        'room TEXT,'
        'priority TEXT,'
        'description TEXT,'
        'hoursWeek INTEGER);');
    
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
      subjects.add(subject);
    }
    return subjects;
  }

  void addNewSubject(Subject subject) async {
    var db_connection = await db;
    String query = 'INSERT INTO $TABLE_NAME(title,type,room,priority,'
        'description,hoursWeek)'
        ' VALUES(\'${subject.title}\','
                '\'${subject.type}\','
                '\'${subject.room}\','
                '\'${subject.priority}\','
                '\'${subject.description}\','
                '\'${subject.hoursWeek}\')';

    await db_connection.transaction((transaction) async {
      return await transaction.rawInsert(query);
    });
  }

  void updateSubject(Subject subject) async {
    var db_connection = await db;
    String query = 'UPDATE INTO $TABLE_NAME SET title= \' ${subject.title}\','
        'type= \'${subject.type}\','
        'room=\'${subject.room}\','
        'priority=\'${subject.priority}\','
        'description=\'${subject.description}\','
        'hoursWeek=\'${subject.hoursWeek}\''
        ' WHERE title =${subject.title}';
    await db_connection.transaction((transaction) async {
      return await transaction.rawInsert(query);
    });
  }

  void deleteSubject(Subject subject) async {
    var db_connection = await db;
    String query = 'DELETE FROM $TABLE_NAME WHERE title =${subject.title}';
    await db_connection.transaction((transaction) async {
      return await transaction.rawInsert(query);
    });
  }
}