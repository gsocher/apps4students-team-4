import 'package:easy_study/database/db_creator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class MockDatabase extends Mock implements Database {}
Database mockDatabase = MockDatabase();

void main() {

  test('dbCreator: createDB', () async {
    var mockedDB = mockDatabase;
    DBCreator sut = DBCreator();
    sut.createDB(mockedDB,1);

    String sql = "CREATE TABLE Subject(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "  title TEXT, type TEXT, room TEXT, priority TEXT, description TEXT,"
        " hoursWeek INTEGER, color_alpha INTEGER, color_red INTEGER,"
        " color_green INTEGER, color_blue INTEGER, started_timetracking_at"
        " TEXT, due_date TEXT, time_spent INTEGER, date_of_creation TEXT);";

    verify(mockedDB.execute(sql,null)).called(1);
  });

    test('dbCreator: get database', () async {
      DBCreator sut = DBCreator();
    sut.database;
  });



}
