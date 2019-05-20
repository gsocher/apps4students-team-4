import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/model/Type.dart';
import 'package:easy_study/model/Priority.dart';
import 'package:easy_study/presenter/Settings.dart';
import 'package:easy_study/presenter/SubjectAdd.dart';
import 'package:easy_study/view/SubjectOverview.dart';
import 'package:easy_study/presenter/Map.dart';
import 'package:flutter/material.dart';
import 'package:easy_study/view/ProgressSummary.dart';
class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // TODO: 03.05.2019 Implement MVVM architecture.
  List<Subject> _subjects;
  Widget _widget, _progressSummary;
  AppBar _appBar;

  @override
  void initState() {
    super.initState();
    _appBar = AppBar(title: Text("Exam Planer"));
    // TODO: 02.05.2019 hard coded for now. remove later. We should be using a Database. Or a file containing jsons?
    // TODO: 03.05.2019 If we use database, think about a detailed structure and create a sql lite database.
    _subjects = new List<Subject>();
    _subjects.add(new Subject.name(
        "Software Engineering II",
        Type.WRITTEN_EXAM,
        "T1.011",
        Priority.MINIMALISM,
        "A funny subject.",10,
      Colors.red,120,
        ));
    _subjects.add(new Subject.name(
        "Lineare Algebra",
        Type.PRESENTATION,
        "R1.049",
        Priority.WANT_TO_PASS,
        "I don't know why I am here?",20,Colors.blue,20,
        ));
    _subjects.add(new Subject.name(
        "Compiler",
        Type.ORAL_EXAM_,
        "A1.001",
        Priority.NORMAL,
        "I love this subject so much. Pls let me pass!",10,Colors.green,10,
    ));
    _widget = SubjectOverview(_subjects);
    _progressSummary = ProgressSummary(_subjects);

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
                  onPressed: () => _changeView(SubjectOverview(_subjects))),
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
        body: new Center(
          child : new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Expanded(child:_widget),
            ],
    ),
        ),

        );
  }

  _addSubject(Subject subject) {
    // TODO: 03.05.2019 this has to be part of the mvvm too
    setState(() {
      _subjects.add(subject);
    });
    _changeView(SubjectOverview(_subjects));
  }

  void _changeView(Widget widget) {
    setState(() {
      _widget = widget;
    });
  }
}
// TODO: 03.05.2019 rethink, if this callback is good. or if mvvm is able to reduce this callback.
typedef SubjectCallback = void Function(Subject subject);