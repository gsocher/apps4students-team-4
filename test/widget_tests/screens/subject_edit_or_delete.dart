import 'package:easy_study/presenter/subject_edit_or_delete.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('subject edit or delete validateDueDate with date before now', () {
    var subjectAdd = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectAdd.createState();
    var dateTime = DateTime(2018);
    var validateDueDate2 = createState.validateDueDate(dateTime);
    expect("the date must be ahead of now", validateDueDate2);
  });

  test('subject edit or delete validateDueDate with date = null', () {
    var subjectAdd = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectAdd.createState();
    var validateDueDate = createState.validateDueDate(null);
    expect("Due Date must not be empty.", validateDueDate);
  });
}
