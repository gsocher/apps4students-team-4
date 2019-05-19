import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/presenter/SubjectEditOrDelete.dart';
import 'package:easy_study/store/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SubjectCard extends StatefulWidget {
  final Subject subject;

  const SubjectCard({Key key, this.subject}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store>(
        converter: (store) => store,
        builder: (context, callback) {
          return GestureDetector(
              onLongPress: () => callback
                ..dispatch(
                    ChangeView(SubjectEditOrDelete(subject: widget.subject))),
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
                                widget.subject.title,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
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
                                    color: widget.subject.color,
                                  ))
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(widget.subject.type.toString()),
                                Text(widget.subject.dueDate.toIso8601String()),
                                Text(widget.subject.room.toString()),
                                Text(widget.subject.description)
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(widget.subject.hoursWeek.toString()),
                                Text(widget.subject.priority.toString())
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )));
        });
  }
}
