import 'package:easy_study/database/db_creator.dart';
import 'package:easy_study/database/db_helper.dart';
import 'package:easy_study/interface/AppBarActions.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/view/home.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class AppState {
  final DBHelper dbHelper;
  final AppBarActionsBase widget;
  final AppBar appBar;

  AppState({this.widget, this.dbHelper, this.appBar});

  factory AppState.initial() => new AppState(
      dbHelper: DBHelper(DBCreator().database),
      widget: new Home(),
      appBar: AppBar(
        title: Text('Easy Study'),
      ));
}

final searchReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddNewSubject>(_addNewSubject),
  TypedReducer<AppState, UpdateSubject>(_updateSubject),
  TypedReducer<AppState, DeleteSubject>(_deleteSubject),
  TypedReducer<AppState, ChangeView>(_changeView),
]);

class AddNewSubject {
  final Subject subject;

  AddNewSubject(this.subject);
}

class UpdateSubject {
  final AppBarActionsBase widget;
  final Subject subject;

  UpdateSubject(this.subject, this.widget);
}

class DeleteSubject {
  final int id;

  DeleteSubject(this.id);
}

class ChangeView {
  final AppBarActionsBase widget;

  ChangeView(this.widget);

  bool showFAB() {
    return widget.toString() == "SubjectOverview";
  }
}

AppState _addNewSubject(AppState state, AddNewSubject action) => new AppState(
    dbHelper: state.dbHelper,
    widget: new SubjectOverview(),
    appBar: state.appBar)
  ..dbHelper.addNewSubject(action.subject);

AppState _updateSubject(AppState state, UpdateSubject action) => new AppState(
    dbHelper: state.dbHelper,
    widget: action.widget == null ? state.widget : action.widget,
    appBar: state.appBar)
  ..dbHelper.updateSubject(action.subject);

AppState _deleteSubject(AppState state, DeleteSubject action) => new AppState(
    dbHelper: state.dbHelper,
    widget: new SubjectOverview(),
    appBar: state.appBar)
  ..dbHelper.deleteSubject(action.id);

AppState _changeView(AppState state, ChangeView action) => new AppState(
    dbHelper: state.dbHelper,
    widget: action.widget,
    appBar: AppBar(
        title: Text('Easy Study'),
        actions: action.widget.getAppBarActions() != null
            ? action.widget.getAppBarActions()
            : null));
