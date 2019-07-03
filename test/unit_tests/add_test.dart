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
    await tester.press(find.byIcon((Icons.save)));
  });
}
