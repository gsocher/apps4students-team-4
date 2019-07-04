import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/testhelper/test_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('show subject add and test function', (tester) async {
    var createApp = TestHelper.createApp(SubjectAdd());
    await tester.pumpWidget(createApp);
    await tester.pump();
    final textFinder = find.byType(TextFormField);
    await tester.enterText(textFinder.at(0), "Test1");
    await tester.enterText(textFinder.at(1), "Test2");
    await tester.enterText(textFinder.at(2), "Test3");
    await tester.enterText(textFinder.at(3), "5");
    final buttonFinder = find.byType(DropdownButton);
    expect(find.text("Test1"), findsOneWidget);
    expect(find.text("Test2"), findsOneWidget);
    expect(find.text("Test3"), findsOneWidget);
    expect(find.text("5"), findsOneWidget);
    expect(buttonFinder.at(0), isNotNull);
    expect(buttonFinder.at(1), isNotNull);
    final dateFinder = find.byType(DateTimePickerFormField);
    expect(dateFinder, isNotNull);
    await tester.tap(dateFinder);
    var submit = find.byType(IconButton);
    expect(submit, findsOneWidget);
    await tester.tap(submit);
    submit = find.byType(IconButton);
    expect(submit, findsOneWidget);
    await tester.tap(submit);
  });
}
