
import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/testhelper/test_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('show subject add', (tester) async {
    var createApp = TestHelper.createApp(SubjectAdd());
    await tester.pumpWidget(createApp);
    await tester.pump();
    await tester.tap(find.byType(FloatingActionButton));

    await tester.enterText(find.bySemanticsLabel('TITLE'), 'Math');
    await tester.enterText(find.bySemanticsLabel('ROOM'), '1002');
    await tester.enterText(find.bySemanticsLabel('DESCRIPTION'), 'blablabla');
    await tester.tap(find.bySemanticsLabel('DUE_DATE'));
    await tester.tap(find.bySemanticsLabel('D'));

  });
}
