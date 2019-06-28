import 'package:easy_study/database/db_helper.dart';
import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';
import 'package:easy_study/model/subject.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockClass extends Mock implements DBHelper {}

DBHelper mockDBHelper = MockClass();

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

  test('database: getSubjects', () async {
    var dbHelper = mockDBHelper;
    Future<List<Subject>> resultList = Future.value([_getDummySubject()]);
    when(dbHelper.getSubjects()).thenAnswer((_)=> resultList);
    var list = await dbHelper.getSubjects();
    expect(list, await resultList);
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
