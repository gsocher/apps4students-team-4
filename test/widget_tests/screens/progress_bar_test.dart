import 'package:easy_study/testhelper/test_helper.dart';
import 'package:easy_study/view/subject_progress_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test subject progress bar', (tester) async {
    var createApp = TestHelper.createApp(
        SubjectProgressBar(subject: TestHelper.getDummySubject()));
    await tester.pumpWidget(createApp);
  });

  testWidgets('test subject progress bar with switch to timetrack',
      (tester) async {
    var createApp = TestHelper.createApp(SubjectProgressBar(
      subject: TestHelper.getDummySubject3(),
      analytics: new FirebaseAnalytics(),
    ));
    await tester.pumpWidget(createApp);
    await tester.tap(find.byType(SubjectProgressBar));
    await tester.pump();
  });
}
