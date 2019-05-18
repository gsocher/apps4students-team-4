import 'package:easy_study/Database/DBHelper.dart';
import 'package:easy_study/model/Subject.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

@immutable
class AppState {
  final DBHelper dbHelper;
  final Subject subject;
  final int id;

  AppState({this.dbHelper, this.subject, this.id});

  factory AppState.inital() =>
      new AppState(dbHelper: DBHelper());
}

final searchReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddNewSubject>(_addNewSubject),
  TypedReducer<AppState, UpdateSubject>(_updateSubject),
  TypedReducer<AppState, DeleteSubject>(_deleteSubject),
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

AppState _addNewSubject(AppState state, AddNewSubject action) =>
    new AppState(dbHelper: state.dbHelper, subject: action.subject);

AppState _updateSubject(AppState state, UpdateSubject action) =>
  new AppState(dbHelper: state.dbHelper, subject: action.subject);

AppState _deleteSubject(AppState state, DeleteSubject action) =>
    new AppState(dbHelper: state.dbHelper, subject: null, id: action.id);