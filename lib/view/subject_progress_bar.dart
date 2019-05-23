import 'package:easy_study/model/subject.dart';
import 'package:easy_study/presenter/time_tracking.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SubjectProgressBar extends StatelessWidget {
  final Subject subject;

  const SubjectProgressBar({Key key, this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store>(
        converter: (store) => store,
        builder: (context, callback) {
          return GestureDetector(
              onTap: () => callback
                ..dispatch(ChangeView(TimeTracking(subject: subject))),
              child: Card(
                  elevation: 5,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                subject.title,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 25),
                              ),
                              Container(
                                width: 20.0,
                                height: 20.0,
                              ),
                              Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: subject.color,
                                  ))
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Time spent: ${subject.timeSpent} (seconds)",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )));
        });
  }
}
