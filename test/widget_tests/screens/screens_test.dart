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
import 'package:photo_view/photo_view.dart';

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
    final imageFinder = find.byType(PhotoView);
    expect(imageFinder, findsOneWidget);
    final scaffoldfinder = find.byType(Scaffold);
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
    final textfieldFinder = find.byType(TextFormField);
    print(textfieldFinder);
    await tester.enterText(textfieldFinder.at(0), "Test1");
    await tester.enterText(textfieldFinder.at(1), "Test2");
    await tester.enterText(textfieldFinder.at(2), "Test3");
    await tester.enterText(textfieldFinder.at(3), "5");
    final buttonFinder = find.byType(DropdownButton);
    expect(find.text("Test1"), findsOneWidget);
    expect(find.text("Test2"), findsOneWidget);
    expect(find.text("Test3"), findsOneWidget);
    expect(find.text("5"), findsOneWidget);
    expect(buttonFinder.at(0), isNotNull);
    expect(buttonFinder.at(1), isNotNull);
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
