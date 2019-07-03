import 'package:easy_study/database/db_helper.dart';
import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';
import 'package:easy_study/model/subject.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
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

  test('database: get database', () async {
    var mockedDB = mockDatabase;
    var dbHelper = DBHelper(Future.value(mockedDB));
    var have = await dbHelper.database;
    var want = mockedDB;
    expect(have,want);
  });


  test('database: addNewSubject Subject is null', () async {
    var mockedDB = mockDatabase;
    var dbHelper = DBHelper(Future.value(mockedDB));
    var have = await dbHelper.addNewSubject(null);
    var want = -1;
    expect(have,want);
  });

  test('database: addNewSubject', () async {
    var mockedDB = mockDatabase;
    var dbHelper = DBHelper(Future.value(mockedDB));
    var want = 15;
    when(mockDatabase.insert(DBHelper.TABLE_NAME,_getDummySubject().toMap()))
        .thenAnswer((_)=>Future.value(15));
    var have = await dbHelper.addNewSubject(_getDummySubject());


    expect(have,want);
  });

  test('database: getSubjects', () async {
    var mockedDB = mockDatabase;
    var dbHelper = DBHelper(Future.value(mockedDB));
    List<Map<String, dynamic>>answerOfMock = new List();
    answerOfMock.add(_getDummySubject().toMap());
    when(mockedDB.query(DBHelper.TABLE_NAME))
        .thenAnswer((_)=> Future.value(answerOfMock));

    var result = await dbHelper.getSubjects();
    var have = result.first.title;
    var want = _getDummySubject().title;
    expect(want,have);
  });

  test('database: deleteSubject', () async {
    var mockedDB = mockDatabase;
    var dbHelper = DBHelper(Future.value(mockedDB));
    String id = DBHelper.ID;
    var want = 15;
    when(mockedDB.delete(DBHelper.TABLE_NAME, where: '$id = ?', whereArgs: [1]))
        .thenAnswer((_)=>Future.value(want));
    var have  = await dbHelper.deleteSubject(1);
    expect(have,want);
  });

  test('database: updateSubject Subject is null', () async {
    var mockedDB = mockDatabase;
    var dbHelper = DBHelper(Future.value(mockedDB));
    var have = await dbHelper.updateSubject(null);
    var want = -1;
    expect(have,want);
  });

  test('database: updateSubject', () async {
    var mockedDB = mockDatabase;
    var dbHelper = DBHelper(Future.value(mockedDB));
    var want = 15;
    String id = DBHelper.ID;
    when(mockDatabase.update(DBHelper.TABLE_NAME,_getDummySubject().toMap(),
    where: '$id = ?',whereArgs: [_getDummySubject().id]))
        .thenAnswer((_)=>Future.value(want));
    var have = await dbHelper.updateSubject(_getDummySubject());
    expect(have,want);
  });
}
