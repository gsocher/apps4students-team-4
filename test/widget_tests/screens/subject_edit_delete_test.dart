import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/presenter/subject_edit_or_delete.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('subject edit validateDueDate with date', () {
    var subjectEditDelete = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectEditDelete.createState();
    var dateTime = DateTime.now().add(Duration(days: 1));
    var validateDueDate = createState.validateDueDate(dateTime);
    expect(validateDueDate, null);
  });

  test('subject add validateDueDate with date = null', () {
    var subjectAdd = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectAdd.createState();
    var validateDueDate = createState.validateDueDate(null);
    expect("Due Date must not be empty.", validateDueDate);
  });

  test('subject add validateDueDate with date before now', () {
    var subjectAdd = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectAdd.createState();
    var dateTime = DateTime(2018);
    var validateDueDate2 = createState.validateDueDate(dateTime);
    expect("the date must be ahead of now", validateDueDate2);
  });

  test('subject add validateDueDate with date before now', () {
    var subjectAdd = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectAdd.createState();
    String input = "0";
    String want = 'the hours cant be negative nor 0';
    String have = createState.validateHoursPerWeek(input);
    expect(have, want);
  });

  test('subject add validateHoursPerWeek input is 0', () {
    var subjectAdd = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectAdd.createState();
    String input = "0";
    String want = 'the hours cant be negative nor 0';
    String have = createState.validateHoursPerWeek(input);
    expect(have, want);
  });

  test('subject add validateHoursPerWeek', () {
    var subjectAdd = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectAdd.createState();
    String want = SubjectAddState.HOURS_PER_WEEK + ' must not be empty.';
    String have = createState.validateHoursPerWeek(null);
    expect(have, want);
  });

  test('subject add validateHoursPerWeek normal input', () {
    var subjectAdd = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectAdd.createState();
    String input = "20";
    String have = createState.validateHoursPerWeek(input);
    expect(have, null);
  });

  test('subject add validateHoursPerWeek no input', () {
    var subjectAdd = SubjectEditOrDelete();
    SubjectEditOrDeleteState createState = subjectAdd.createState();
    String want = "input cant be empty";
    String input = "";
    String have = createState.validateHoursPerWeek(input);
    expect(have, want);
  });
}
