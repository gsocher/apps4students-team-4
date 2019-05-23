import 'package:easy_study/model/subject.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/main_screen.dart';
import 'package:easy_study/view/progress_summary.dart';
import 'package:easy_study/view/subject_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return new AppStateViewModel(store.state);
      },
      builder: (BuildContext context, AppStateViewModel vm) {
        return new Container(
          child: FutureBuilder<List<Subject>>(
            future: vm.state.dbHelper.getSubjects(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.hasData) {
                  return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        ProgressSummary(snapshot.data),
                        Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return new SubjectProgressBar(
                                      subject: snapshot.data[index]);
                                }))
                      ]);
                }
              }
              return new Container(
                alignment: AlignmentDirectional.center,
                child: new CircularProgressIndicator(),
              );
            },
          ),
        );
      },
    );
  }
}
