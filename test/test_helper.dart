import 'package:easy_study/main.dart';
import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class TestHelper {
  static EasyStudyApp createApp(Widget widget) {
    final store =
        new Store<AppState>(searchReducer, initialState: AppState.initial());
    var app = new EasyStudyApp(
      title: 'Easy Study',
      store: store,
    );
    app.store.dispatch(ChangeView(widget));
    return app;
  }

  static Subject getDummySubject() {
    return Subject.name(
        "Software Engineering II",
        ExamType.WRITTEN_EXAM,
        "T1.011",
        Priority.MINIMALISM,
        "A funny subject.",
        5,
        DateTime.parse('2019-06-10 16:27:46.371368'),
        DateTime.parse('2019-06-13 09:06:27.669877'));
  }
}
