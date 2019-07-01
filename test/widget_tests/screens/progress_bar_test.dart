import 'package:easy_study/testhelper/test_helper.dart';
import 'package:easy_study/view/subject_progress_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test subject progress bar', (tester) async {
    var createApp = TestHelper.createApp(SubjectProgressBar(subject: TestHelper.getDummySubject()));
    await tester.pumpWidget(createApp);
  });
}
