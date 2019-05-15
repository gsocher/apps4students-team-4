import 'package:easy_study/Database/DBHelper.dart';
import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/model/Type.dart';
import 'package:easy_study/model/Priority.dart';
import 'package:easy_study/presenter/Settings.dart';
import 'package:easy_study/presenter/SubjectAdd.dart';
import 'package:easy_study/view/SubjectOverview.dart';
import 'package:easy_study/presenter/Map.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // TODO: 03.05.2019 Implement MVVM architecture.
  //List<Subject> _subjects;
  Widget _widget;
  AppBar _appBar;


  @override
  void initState() {
    super.initState();
    _appBar = AppBar(title: Text("Exam Planer"));
    // TODO: 02.05.2019 hard coded for now. remove later. We should be using a Database. Or a file containing jsons?
    // TODO: 03.05.2019 If we use database, think about a detailed structure and create a sql lite database.
    //_addInitialSubjects();
    //deleteSubject();
    //updateSubject();
    _widget = SubjectOverview();
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => _changeView(SubjectOverview())),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _changeView(SubjectAdd(onSubjectAdd: (Subject subject) => _addSubject(subject),))),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => _changeView(Settings()),
              ),
              IconButton(
                icon: Icon(Icons.map),
                onPressed: () => _changeView(Map()),
              )
            ],
          ),
        ),
        body: _widget);
  }

  _addSubject(Subject subject) {
    // TODO: 03.05.2019 this has to be part of the mvvm too
    setState(() {
      var dbHelper = DBHelper();
      dbHelper.addNewSubject(subject);
    });
    _changeView(SubjectOverview());
  }

  void _changeView(Widget widget) {
    setState(() {
      _widget = widget;
    });
  }
  //just for test reasons.
  void _addInitialSubjects(){
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
  //just for test Reasons
void deleteSubject(){
    var dbHelper = DBHelper();
    dbHelper.deleteSubject(1);
    dbHelper.deleteSubject(2);
}
void updateSubject(){
    var dbHelper = DBHelper();
    var x =new Subject.name(
        "Software Engineering II",
        Type.WRITTEN_EXAM,
        "T1.011",
        Priority.MINIMALISM,
        "A funny subject.",
        5);
    x.id = 3;
    dbHelper.updateSubject(x);
}
}
// TODO: 03.05.2019 rethink, if this callback is good. or if mvvm is able to reduce this callback.
typedef SubjectCallback = void Function(Subject subject);