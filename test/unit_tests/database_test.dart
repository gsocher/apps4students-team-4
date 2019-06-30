import 'package:easy_study/database/db_helper.dart';
import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';
import 'package:easy_study/model/subject.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqlite_api.dart';

class MockDatabase extends Mock implements Database {}

Database mockDatabase = MockDatabase();

void main() {
  Subject _getDummySubject() {
    return Subject.name(
        "Software Engineering II",
        ExamType.WRITTEN_EXAM,
        "T1.011",
        Priority.MINIMALISM,
        "A funny subject.",
        5,
        DateTime.parse('2019-06-10 16:27:46.371368'),
        DateTime.parse('2019-06-13 09:06:27.669877'));
  }

  test('database: initDB', () async {
    var databaseMocked = mockDatabase;
    DBHelper sut = DBHelper();
    sut.createDB(databaseMocked,1);
    //when(sut.createDB(mockDatabase, 1)).thenAnswer((_)=> Future.value(databaseMocked));

    String sql = "CREATE TABLE Subject(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "  title TEXT, type TEXT, room TEXT, priority TEXT, description TEXT,"
        " hoursWeek INTEGER, color_alpha INTEGER, color_red INTEGER,"
        " color_green INTEGER, color_blue INTEGER, started_timetracking_at"
        " TEXT, due_date TEXT, time_spent INTEGER, date_of_creation TEXT);";

    verify(databaseMocked.execute(sql,null)).called(1);

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
