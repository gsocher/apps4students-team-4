// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:easy_study/main.dart';
import 'package:easy_study/model/Priority.dart';
import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/model/Type.dart';
import 'package:easy_study/presenter/Map.dart';
import 'package:easy_study/presenter/Settings.dart';
import 'package:easy_study/presenter/SubjectAdd.dart';
import 'package:easy_study/presenter/SubjectEditOrDelete.dart';
import 'package:easy_study/store/AppState.dart';
import 'package:easy_study/view/SubjectOverview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  Subject _getDummySubject() {
    return Subject.name("Software Engineering II", Type.WRITTEN_EXAM, "T1.011",
        Priority.MINIMALISM, "A funny subject.", 5);
  }

  EasyStudyApp _createApp() {
    final store = new Store<AppState>(searchReducer,
        initialState: AppState.initial());
    return new EasyStudyApp(
      title: 'Easy Study',
      store: store,
    );
  }

  test('reducer changes view to subject overview', () {
    final widget = SubjectOverview();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  test('reducer changes view to subject add', () {
    final widget = SubjectAdd();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  test('reducer changes view to subject overview', () {
    final widget = SubjectOverview();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  test('reducer changes view to subject edit or delete', () {
    final widget = SubjectEditOrDelete(subject: _getDummySubject());
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  test('reducer changes view to map', () {
    final widget = Map();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  test('reducer changes view to settings', () {
    final widget = Settings();
    final state = searchReducer(new AppState.initial(), ChangeView(widget));
    expect(state.widget, widget);
  });

  testWidgets('add subject to the database', (tester) async {
    var createApp = _createApp();
    createApp.store.dispatch(AddNewSubject(_getDummySubject()));
    // TODO: 22.05.2019 how to test this?
  });

  testWidgets('add subject to the database and update it afterwards', (tester) async {
    var createApp = _createApp();
    var sub = _getDummySubject();
    createApp.store.dispatch(AddNewSubject(sub));
    sub = new Subject.name("neuer titel", sub.type, sub.room, sub.priority, sub.description, sub.hoursWeek);
    createApp.store.dispatch(UpdateSubject(sub));
    // TODO: 22.05.2019 how to test this?
  });

  testWidgets('add subject to the database and delete it afterwards', (tester) async {
    var createApp = _createApp();
    createApp.store.dispatch(AddNewSubject(_getDummySubject()));
    createApp.store.dispatch(DeleteSubject(_getDummySubject().id));
    // TODO: 22.05.2019 how to test this?
  });
}
