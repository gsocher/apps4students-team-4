import 'package:easy_study/main.dart';
import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/presenter/hm_map.dart';
import 'package:easy_study/presenter/settings.dart';
import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/presenter/subject_edit_or_delete.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/home.dart';
import 'package:easy_study/view/progress_summary.dart';
import 'package:easy_study/view/subject_card.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  Subject _getDummySubjectOne() {
    return Subject.name(
        "Software Engineering II",
        ExamType.WRITTEN_EXAM,
        "T1.011",
        Priority.MINIMALISM,
        "A funny subject.",
        5,
        DateTime.parse('2019-06-10 16:27:46.371368'),
        DateTime.now());
  }
  Subject _getDummySubjectTwo() {
    return Subject.name(
        "Meditation",
        ExamType.ORAL_EXAM,
        "R1.012",
        Priority.NORMAL,
        "A helping subject.",
        6,
        DateTime.parse('2019-10-10 16:27:46.371368'),
        DateTime.now());
  }
  List<Subject> _subjects = new  List<Subject>();
  _subjects.add(_getDummySubjectOne());
//  _subjects.add(_getDummySubjectTwo());
  print(_subjects.toString());

  EasyStudyApp _createApp(Widget widget) {
    final store =
        new Store<AppState>(searchReducer, initialState: AppState.initial());
    var app = new EasyStudyApp(
      title: 'Easy Study',
      store: store,
    );
    app.store.dispatch(ChangeView(widget));
    return app;
  }

  testWidgets('show subject overview', (tester) async {
    var createApp = _createApp(SubjectOverview());
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show subject card', (tester) async {
    var createApp = _createApp(SubjectCard(
      subject: _getDummySubjectOne(),
    ));
    await tester.pumpWidget(createApp);
    await tester.pump();
    // TODO: 22.05.2019 how to test this?
  });

  testWidgets('show hm map', (tester) async {
    var createApp = _createApp(HmMap());
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show home', (tester) async {
    var createApp = _createApp(Home());
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show settings', (tester) async {
    var createApp = _createApp(Settings());
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show subject add', (tester) async {
    var createApp = _createApp(SubjectAdd());
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show subject edit or delete', (tester) async {
    var createApp = _createApp(SubjectEditOrDelete(
      subject: _getDummySubjectOne(),
    ));
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets('show progress_summary', (tester) async {
    var createApp = _createApp(
      ProgressSummary(_subjects),
    );
    await tester.pumpWidget(createApp);
    await tester.pump();
  });
}
