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
import 'package:easy_study/presenter/hm_map.dart';
import 'package:easy_study/presenter/settings.dart';
import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/presenter/subject_edit_or_delete.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  Subject _getDummySubject() {
    return Subject.name("Software Engineering II", ExamType.WRITTEN_EXAM,
        "T1.011", Priority.MINIMALISM, "A funny subject.", 5);
  }

  EasyStudyApp _createApp() {
    final store =
        new Store<AppState>(searchReducer, initialState: AppState.initial());
    return new EasyStudyApp(
      title: 'Easy Study',
      store: store,
    );
  }

  test('reducer changes view to subject overview', () {
    final widget = new SubjectOverview();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  test('reducer changes view to subject add', () {
    final widget = new SubjectAdd();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  test('reducer changes view to subject edit or delete', () {
    final widget = new SubjectEditOrDelete(subject: _getDummySubject());
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  test('reducer changes view to map', () {
    final widget = new HmMap();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  test('reducer changes view to settings', () {
    final widget = new Settings();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  testWidgets('add subject to the database', (tester) async {
    var createApp = _createApp();
    createApp.store.dispatch(AddNewSubject(_getDummySubject()));
    // TODO: 22.05.2019 how to test this?
  });

  testWidgets('add subject to the database and update it afterwards',
      (tester) async {
    var createApp = _createApp();
    var sub = _getDummySubject();
    createApp.store.dispatch(AddNewSubject(sub));
    sub = new Subject.name("neuer titel", sub.type, sub.room, sub.priority,
        sub.description, sub.hoursWeek);
    createApp.store.dispatch(UpdateSubject(sub));
    // TODO: 22.05.2019 how to test this?
  });

  testWidgets('add subject to the database and delete it afterwards',
      (tester) async {
    var createApp = _createApp();
    createApp.store.dispatch(AddNewSubject(_getDummySubject()));
    createApp.store.dispatch(DeleteSubject(_getDummySubject().id));
    // TODO: 22.05.2019 how to test this?
  });

  testWidgets('show subject overview', (tester) async{
    var createApp = _createApp();
    createApp.store.dispatch(ChangeView(new SubjectOverview()));
    await tester.pumpWidget(createApp);
    await tester.pump();
  });
}
