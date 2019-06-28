import 'package:easy_study/model/subject.dart';
import 'package:easy_study/presenter/time_tracking.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SubjectProgressBar extends StatelessWidget {
  final Subject subject;
  final double fontSizeNormal = 17.0;
  final Color textColor = Colors.black87;

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
                  margin:
                      new EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                  elevation: 5,
                  child: Container(
                    margin: new EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                subject.title.toUpperCase(),
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: fontSizeNormal,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              ((subject.timeSpent / 3600).truncate())
                                      .toString() +
                                  "h " +
                                  (subject.timeSpent / 60)
                                      .truncate()
                                      .toString() +
                                  "mn",
                              style: TextStyle(
                                  color: textColor, fontSize: fontSizeNormal),
                            ),
                            Text(
                              _getTimeUntilDueDate(subject),
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: fontSizeNormal,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: _getProgressRatio(subject),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(subject.color),
                          backgroundColor: Colors.black12,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              (_getProgressRatio(subject) * 100).toInt()
                                      .toString() +
                                  " %",
                              style: TextStyle(
                                  color: textColor, fontSize: fontSizeNormal),
                            )
                          ],
                        ),
                      ],
                    ),
                  )));
        });
  }

  static String _getTimeUntilDueDate(Subject subject) {
    int days;
    String timeUntilDD;
    days = subject.dueDate.difference(DateTime.now()).inDays;
    if (days > 0) {
      timeUntilDD = days.toString() + " days until due date";
    } else {
      timeUntilDD = "Due date has passed";
    }

    return timeUntilDD;
  }

  static double _getProgressRatio(Subject subject) {
    double ratio = 0;
    // ignore: unrelated_type_equality_checks
    if (subject.dueDate.difference(subject.dateOfCreation).inSeconds > 0 && subject.hoursWeek!=0) {
      ratio = (((subject.timeSpent * 7) / 3600) /
          (subject.hoursWeek *
              (subject.dueDate.difference(subject.dateOfCreation).inDays))).truncateToDouble();
    }
    return ratio;
  }
}
