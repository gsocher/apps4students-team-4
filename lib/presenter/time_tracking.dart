import 'dart:async';

import 'package:easy_study/model/subject.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TimeTracking extends StatefulWidget {
  final Subject subject;

  const TimeTracking({Key key, this.subject}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimeTracking();
}

class _TimeTracking extends State<TimeTracking> {
  Timer timer;
  String printedTime = '00:00:00';
  DateTime elapsedTime;

  _startTimer() {
    elapsedTime = DateTime.parse(widget.subject.startedTimetrackingAt);
    printedTime = _getDifference(elapsedTime);
    if (timer == null || !timer.isActive) {
      timer = new Timer.periodic(new Duration(milliseconds: 1000), _updateTime);
    }
  }

  _updateTime(Timer timer) {
    setState(() {
      printedTime = _getDifference(elapsedTime);
    });
  }

  Subject _startWatch() {
    Subject sub;
    if (timer == null || !timer.isActive) {
      elapsedTime = DateTime.now();
      sub = Subject.copy(widget.subject);
      sub.startedTimetrackingAt = elapsedTime.toString();
      timer = new Timer.periodic(new Duration(milliseconds: 1000), _updateTime);
    }
    return sub;
  }

  Subject _stopWatch() {
    Subject sub;
    if (timer != null && timer.isActive) {
      timer.cancel();
      if (elapsedTime != null) {
        sub = Subject.copy(widget.subject);
        sub.startedTimetrackingAt = null;
        sub.timeSpent =
            sub.timeSpent + DateTime.now().difference(elapsedTime).inSeconds;
      }
      elapsedTime = null;
      setState(() {
        printedTime = '00:00:00';
      });
    }
    return sub;
  }

  _getDifference(DateTime time) {
    Duration diff = DateTime.now().difference(time);
    String hoursStr = diff.inHours.toString().padLeft(2, '0');
    String minutesStr = (diff.inMinutes % 60).toString().padLeft(2, '0');
    String secondsStr = (diff.inSeconds % 60).toString().padLeft(2, '0');
    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  Widget build(BuildContext context) {
    if (widget.subject.startedTimetrackingAt == null && timer == null) {
      printedTime = '00:00:00';
    } else if (timer == null) {
      _startTimer();
    }

    return Scaffold(
        body: new Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(printedTime,
                    style: new TextStyle(color: Colors.white, fontSize: 60.0)),
                SizedBox(height: 20.0),
                new Container(
                  height: 60,
                ),
                new StoreConnector<AppState, Store>(
                    converter: (store) => store,
                    builder: (context, callback) {
                      return new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new FloatingActionButton(
                              backgroundColor: Colors.green,
                              onPressed: () => callback
                                  .dispatch(UpdateSubject(_startWatch(), null)),
                              child: new Icon(Icons.play_arrow)),
                          SizedBox(width: 40.0),
                          new FloatingActionButton(
                              backgroundColor: Colors.red,
                              onPressed: () => callback
                                ..dispatch(UpdateSubject(
                                    _stopWatch(), SubjectOverview())),
                              child: new Icon(Icons.stop)),
                          SizedBox(width: 20.0),
                        ],
                      );
                    })
              ],
            )));
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }
}
