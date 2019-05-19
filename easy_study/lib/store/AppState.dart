import 'package:easy_study/Database/DBHelper.dart';
import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/view/SubjectOverview.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class AppState {
  final DBHelper dbHelper;
  final Widget widget;

  AppState({this.widget, this.dbHelper});



  factory AppState.initial() =>
      new AppState(dbHelper: DBHelper(), widget: new SubjectOverview());

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
  final Subject subject;
  UpdateSubject(this.subject);
}
class DeleteSubject {
  final int id;
  DeleteSubject(this.id);
}

class ChangeView {
  final Widget widget;
  ChangeView(this.widget);
  bool showFAB(){
    return widget.toString() == "SubjectOverview";
  }
}

AppState _addNewSubject(AppState state, AddNewSubject action) =>
    new AppState(dbHelper: state.dbHelper, widget: new SubjectOverview())..dbHelper.addNewSubject(action.subject);

AppState _updateSubject(AppState state, UpdateSubject action) =>
  new AppState(dbHelper: state.dbHelper,widget: new SubjectOverview())..dbHelper.updateSubject(action.subject);

AppState _deleteSubject(AppState state, DeleteSubject action) =>
    new AppState(dbHelper: state.dbHelper,widget: new SubjectOverview())..dbHelper.deleteSubject(action.id);

AppState _changeView(AppState state, ChangeView action) =>
    new AppState(dbHelper: state.dbHelper, widget: action.widget);