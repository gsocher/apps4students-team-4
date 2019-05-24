// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:easy_study/main.dart';
import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  EasyStudyApp _createApp() {
    final store =
        new Store<AppState>(searchReducer, initialState: AppState.initial());
    return new EasyStudyApp(
      title: 'Easy Study',
      store: store,
    );
  }

  Subject _getDummySubject() {
    return Subject.name("Software Engineering II", ExamType.WRITTEN_EXAM,
        "T1.011", Priority.MINIMALISM, "A funny subject.", 5);
  }

  test('reducer changes view to subject overview', () {
    final widget = new SubjectOverview();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  testWidgets('reducer updates subject', (tester) async {
    var createApp = _createApp();
    createApp.store.dispatch(UpdateSubject(_getDummySubject()));
    await tester.pumpWidget(createApp);
    await tester.pump();
    // TODO: 23.05.2019 How to test, if this worked?
  });

  testWidgets('reducer adds subject', (tester) async {
    var createApp = _createApp();
    createApp.store.dispatch(AddNewSubject(_getDummySubject()));
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('reducer adds subject and deletes afterwards', (tester) async {
    var createApp = _createApp();
    createApp.store.dispatch(AddNewSubject(_getDummySubject()));
    createApp.store.dispatch(DeleteSubject(_getDummySubject().id));
    await tester.pumpWidget(createApp);
    await tester.pump();
  });
}
