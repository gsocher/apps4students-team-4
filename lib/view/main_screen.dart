import 'package:easy_study/model/subject.dart';
import 'package:easy_study/presenter/home.dart';
import 'package:easy_study/presenter/hm_map.dart';
import 'package:easy_study/presenter/settings.dart';
import 'package:easy_study/presenter/subject_add.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/subject_overview.dart';
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
                      onPressed: () => callback..dispatch(ChangeView(Home()))),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => callback..dispatch(ChangeView(SubjectOverview()))),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () => callback..dispatch(ChangeView(Settings())),
                  ),
                  IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () => callback..dispatch(ChangeView(HmMap())),
                  )
                ],
              ),
            ),
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
}

class AppStateViewModel {
  final AppState state;

  AppStateViewModel(this.state);

}

// TODO: 03.05.2019 rethink, if this callback is good. or if mvvm is able to reduce this callback.
typedef SubjectCallback = void Function(Subject subject);
