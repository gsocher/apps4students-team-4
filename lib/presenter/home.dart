import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/store/AppState.dart';
import 'package:easy_study/view/MainScreen.dart';
import 'package:easy_study/view/ProgressSummary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatelessWidget {
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
                if (snapshot.data.length !=0) {
                  return ProgressSummary(snapshot.data);
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
