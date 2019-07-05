import 'package:easy_study/presenter/hm_map.dart';
import 'package:easy_study/presenter/settings.dart';
import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/home.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MainScreen extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  MainScreen({this.analytics, this.observer});

  @override
  State<StatefulWidget> createState() =>
      _MainScreenState(analytics: analytics, observer: observer);
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  _MainScreenState({this.analytics, this.observer});

  int _selectedIndex = 0;
  List<Widget> _widgets;

  @override
  Widget build(BuildContext context) {
    if (_widgets == null) {
      _widgets = <Widget>[
        Home(analytics: analytics, observer: observer),
        SubjectOverview(),
        Settings(),
        HmMap(),
      ];
    }
    return WillPopScope(
        onWillPop: onWillPop,
        child: new StoreConnector<AppState, Store>(
          converter: (store) => store,
          builder: (context, callback) {
            return new Scaffold(
                appBar: AppBar(
                  title: Text("Exam Planer"),
                ),
                bottomNavigationBar: BottomNavigationBar(
                    onTap: (index) => _changeView(index, callback),
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.blue,
                    unselectedItemColor: Colors.black,
                    currentIndex: _selectedIndex,
                    elevation: 20,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.storage), title: Text('Overview')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.add), title: Text('Add')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.settings), title: Text('Settings')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.map), title: Text('Map'))
                    ]),
                body: callback.state.widget,
                floatingActionButton: Visibility(
                  visible: ChangeView(callback.state.widget).showFAB(),
                  child: FloatingActionButton(
                    onPressed: () =>
                        callback..dispatch(ChangeView(SubjectAdd())),
                    child: Icon(Icons.add),
                  ),
                ));
          },
        ));
  }

  Future<bool> onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: new Text('Exit Easy Study?'),
                elevation: 20.0,
                content: new Text('Are you sure you want to exit Easy Study?'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    shape: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1.0),
                    child: new Text('Cancel'),
                  ),
                  new RaisedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: new Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
        ) ??
        false;
  }

  void _changeView(int index, Store callback) {
    setState(() {
      _selectedIndex = index;
    });
    _logScreenChange(_widgets.elementAt(index).toStringShort());
    callback.dispatch(ChangeView(_widgets.elementAt(index)));
  }

  Future<void> _logScreenChange(String screen) async {
    await analytics.setCurrentScreen(screenName: screen);
  }
}

class AppStateViewModel {
  final AppState state;

  AppStateViewModel(this.state);
}
