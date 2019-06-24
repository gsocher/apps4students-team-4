import 'package:easy_study/presenter/hm_map.dart';
import 'package:easy_study/presenter/settings.dart';
import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/presenter/subject_edit_or_delete.dart';
import 'package:easy_study/presenter/time_tracking.dart';
import 'package:easy_study/testhelper/test_helper.dart';
import 'package:easy_study/view/home.dart';
import 'package:easy_study/view/progress_summary.dart';
import 'package:easy_study/view/subject_card.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('show subject overview', (tester) async {
    var createApp = TestHelper.createApp(SubjectOverview());
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show subject progress bar', (tester) async {
    var createApp = TestHelper.createApp(
        SubjectCardProgressBar(TestHelper.getDummySubject()));
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show progress summary', (tester) async {
    var createApp = TestHelper.createApp(ProgressSummary(
        [TestHelper.getDummySubject(), TestHelper.getDummySubject()]));
    await tester.pumpWidget(createApp);
    await tester.pump();
  });
  testWidgets('show subject card', (tester) async {
    var createApp = TestHelper.createApp(SubjectCard(
      subject: TestHelper.getDummySubject(),
    ));
    await tester.pumpWidget(createApp);
    await tester.pump();
    // TODO: 22.05.2019 how to test this?
  });

  testWidgets('show hm map', (tester) async {
    var createApp = TestHelper.createApp(HmMap());
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show home', (tester) async {
    var createApp = TestHelper.createApp(Home());
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show settings', (tester) async {
    var createApp = TestHelper.createApp(Settings());
    await tester.pumpWidget(createApp);
    await tester.pump();
    final buttonFinder = find.byType(RaisedButton);
    await tester.tap(buttonFinder);
    expect(buttonFinder, isNotNull);
  });

  testWidgets('show subject add', (tester) async {
    var createApp = TestHelper.createApp(SubjectAdd());
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show subject edit or delete', (tester) async {
    var createApp = TestHelper.createApp(SubjectEditOrDelete(
      subject: TestHelper.getDummySubject(),
    ));
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show time tracking', (tester) async {
    var createApp = TestHelper.createApp(TimeTracking(
      subject: TestHelper.getDummySubject(),
    ));
    await tester.pumpWidget(createApp);
    await tester.pump();
  });
}
