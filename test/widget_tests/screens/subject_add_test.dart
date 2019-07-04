import 'package:easy_study/presenter/subject_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('subject add screen onChanged', () {
    var subjectAdd = SubjectAdd();
    SubjectAddState createState = subjectAdd.createState();
    var hsvColor = HSVColor.fromColor(Colors.red);
    createState.onChanged(hsvColor);
    expect(createState.color, hsvColor);
  });

  test('subject add validateDueDate with date', () {
    var subjectAdd = SubjectAdd();
    SubjectAddState createState = subjectAdd.createState();
    var dateTime = DateTime.now().add(Duration(days: 1));
    var validateDueDate = createState.validateDueDate(dateTime);
    expect(validateDueDate, null);
  });

  test('subject add validateDueDate with date = null', () {
    var subjectAdd = SubjectAdd();
    SubjectAddState createState = subjectAdd.createState();
    var validateDueDate = createState.validateDueDate(null);
    expect("Due Date must not be empty.", validateDueDate);
  });

  test('subject add validateDueDate with date before now', () {
    var subjectAdd = SubjectAdd();
    SubjectAddState createState = subjectAdd.createState();
    var dateTime = DateTime(2018);
    var validateDueDate2 = createState.validateDueDate(dateTime);
    expect("the date must be ahead of now", validateDueDate2);
  });

  testWidgets('subject add submit subject', (tester) async {
    var subjectAdd = SubjectAdd();
    Widget query = MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: subjectAdd),
    );
    await tester.pumpWidget(query);
    var saveButton = find.byType(IconButton);
    await tester.tap(saveButton);
    await tester.pump();
  });
}
