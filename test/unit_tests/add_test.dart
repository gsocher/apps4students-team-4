import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/testhelper/test_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('show subject add', (tester) async {
    var createApp = TestHelper.createApp(SubjectAdd());
    await tester.pumpWidget(createApp);
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));

    //await tester.tap(find.byType(TextFormField));
    //await tester.showKeyboard(find.by(TextFormField));
    //await tester.enterText(find.byType(TextFormField).first,"title");
    //await tester.enterText(find.bySemanticsLabel('ROOM'), '1002');
    //await tester.enterText(find.bySemanticsLabel('DESCRIPTION'), 'blablabla');
    //await tester.enterText(find.bySemanticsLabel('DUE_DATE'),'Sun');
    //await tester.enterText(find.bySemanticsLabel('HOURS_PER_WEEK'),'12');
    await tester.tap(find.byIcon((Icons.save)));
    //await tester.tap(find.byIcon((Icons.save)));
  });
}
