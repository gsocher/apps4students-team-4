import 'package:easy_study/presenter/hm_map.dart';
import 'package:easy_study/presenter/settings.dart';
import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/home.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgets = <Widget>[
    Home(),
    SubjectOverview(),
    Settings(),
    HmMap(),
  ];

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, Store>(
      converter: (store) => store,
      builder: (context, callback) {
        return new Scaffold(
            appBar: AppBar(title: Text("Exam Planer")),
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
                onPressed: () => callback..dispatch(ChangeView(SubjectAdd())),
                child: Icon(Icons.add),
              ),
            ));
      },
    );
  }

  void _changeView(int index, Store callback) {
    setState(() {
      _selectedIndex = index;
    });
    callback.dispatch(ChangeView(_widgets.elementAt(index)));
  }
}

class AppStateViewModel {
  final AppState state;

  AppStateViewModel(this.state);
}
