import 'package:easy_study/Database/DBHelper.dart';
import 'package:easy_study/model/Priority.dart';
import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/model/Type.dart';
import 'package:easy_study/presenter/Map.dart';
import 'package:easy_study/presenter/Settings.dart';
import 'package:easy_study/presenter/SubjectAdd.dart';
import 'package:easy_study/store/AppState.dart';
import 'package:easy_study/view/SubjectOverview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AppBar _appBar;

  @override
  void initState() {
    super.initState();
    _appBar = AppBar(title: Text("Exam Planer"));
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, Store>(
      converter: (store) => store,
      builder: (context, callback) {
        return new Scaffold(
            appBar: _appBar,
            bottomNavigationBar: BottomAppBar(
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // TODO: 03.05.2019 The buttons should be seperated by a line and be wider. So you can click next to the icon and also hit it.
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.storage),
                      onPressed: () => callback..dispatch(ChangeView(SubjectOverview()))),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => callback..dispatch(ChangeView(SubjectAdd()))),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () => callback..dispatch(ChangeView(Settings())),
                  ),
                  IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () => callback..dispatch(ChangeView(Map())),
                  )
                ],
              ),
            ),
            body: callback.state.widget);
      },
    );
  }

  //just for test reasons.
  void _addInitialSubjects() {
    var dbHelper = DBHelper();
    dbHelper.addNewSubject(new Subject.name(
        "Software Engineering II",
        Type.WRITTEN_EXAM,
        "T1.011",
        Priority.MINIMALISM,
        "A funny subject.",
        5));
    dbHelper.addNewSubject(new Subject.name(
        "Lineare Algebra",
        Type.PRESENTATION,
        "R1.049",
        Priority.WANT_TO_PASS,
        "I don't know why I am here?",
        7));
    dbHelper.addNewSubject(new Subject.name(
        "Compiler",
        Type.ORAL_EXAM,
        "A1.001",
        Priority.NORMAL,
        "I love this subject so much. Pls let me pass!",
        13));
  }
}

class AppStateViewModel {
  final AppState state;

  AppStateViewModel(this.state);

}

// TODO: 03.05.2019 rethink, if this callback is good. or if mvvm is able to reduce this callback.
typedef SubjectCallback = void Function(Subject subject);
