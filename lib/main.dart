import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = new Store<AppState>(searchReducer,
      initialState: AppState.initial());
  runApp(new EasyStudyApp(
    title: 'Easy Study',
    store: store,
  ));
}

class EasyStudyApp extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  EasyStudyApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
          title: title,
          home: new MainScreen()),
    );
  }
}

