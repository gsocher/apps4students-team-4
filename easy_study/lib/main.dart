import 'package:easy_study/Database/DBHelper.dart';
import 'package:easy_study/store/AppState.dart';
import 'package:redux/redux.dart';
import 'package:easy_study/view/MainScreen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';

void main() {
  final store = new Store<AppState>(searchReducer, initialState: AppState.inital());
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
    // TODO: implement build
    return new StoreProvider<AppState>(
      store: store,
        child: new MaterialApp(
          title: title,
          home: MainScreen()
        ),
    );
  }
}

