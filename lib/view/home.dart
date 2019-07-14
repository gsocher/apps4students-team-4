import 'package:easy_study/interface/AppBarActions.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/main_screen.dart';
import 'package:easy_study/view/progress_summary.dart';
import 'package:easy_study/view/subject_progress_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends AppBarActionsStateful {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  Home({this.analytics, this.observer});

  @override
  State<StatefulWidget> createState() =>
      _HomeState(analytics: analytics, observer: observer);

  @override
  List<Widget> getAppBarActions() {
    return null;
  }
}

class _HomeState extends State<Home> {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  _HomeState({this.analytics, this.observer});

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
                  if (snapshot.data.isNotEmpty) {
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
                                      subject: snapshot.data[index],
                                      analytics: analytics,
                                      observer: observer,
                                    );
                                  }))
                        ]);
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Welcome !",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Add a subject to begin",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    );
                  }
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
