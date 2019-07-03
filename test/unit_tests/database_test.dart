import 'package:easy_study/database/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class MockDatabase extends Mock implements Database {}
class MockSqflite extends Mock implements Sqflite {}
class MockedDbHelper extends Mock implements DBHelper{}


Database mockDatabase = MockDatabase();
Sqflite mockSqflite = MockSqflite();

void main() {

  test('database: createDB', () async {
    var databaseMocked = mockDatabase;
    DBHelper sut = DBHelper();
    sut.createDB(databaseMocked,1);


    String sql = "CREATE TABLE Subject(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "  title TEXT, type TEXT, room TEXT, priority TEXT, description TEXT,"
        " hoursWeek INTEGER, color_alpha INTEGER, color_red INTEGER,"
        " color_green INTEGER, color_blue INTEGER, started_timetracking_at"
        " TEXT, due_date TEXT, time_spent INTEGER, date_of_creation TEXT);";

    verify(databaseMocked.execute(sql,null)).called(1);

  });

  test('database: initDB', () async {
    DBHelper sut = MockedDbHelper();
    var databaseMocked = mockDatabase;

    when(sut.initDB()).thenAnswer((_)=> Future.value(databaseMocked));

verifyNever(sut.initDB());
  });

  test('database: get database', () async {
    DBHelper sut = DBHelper();
    sut.database;
  });



//  test('database: addNewSubject', () async {
//    var dbHelper = DBHelper();
//    var i = await dbHelper.addNewSubject(_getDummySubject());
//  });
//
//  test('database: updateSubject', () async {
//    var dbHelper = DBHelper();
//    var i = await dbHelper.updateSubject(_getDummySubject());
//  });
//
//  test('database: deleteSubject', () async {
//    var dbHelper = DBHelper();
//    var i = await dbHelper.deleteSubject(1);
//  });
}
