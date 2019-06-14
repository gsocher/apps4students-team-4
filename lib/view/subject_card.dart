import 'package:date_format/date_format.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/presenter/subject_edit_or_delete.dart';
import 'package:easy_study/store/app_state.dart';
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
  final double fontText = 17.0;
  final Color textColor = Colors.black87;

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
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.subject.title.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: fontText,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 10.0,
                                height: 20.0,
                              ),
                              Container(
                                  width: 40.0,
                                  height: 25.0,
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    shape: BoxShape.rectangle,
                                    color: widget.subject.color,
                                  ))
                            ]),
                        Row(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.subject.type.toString(),
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontText,
                                  ),
                                ),
                                Text(
                                  formatDate(widget.subject.dueDate, [
                                    dd,
                                    '/',
                                    mm,
                                    '/',
                                    yyyy,
                                    ' ',
                                    hh,
                                    ':',
                                    mm,
                                    am,
                                  ]).toString(),
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontText,
                                  ),
                                ),
                                Text(
                                  widget.subject.room.toString(),
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontText,
                                  ),
                                ),
                                Text(
                                  widget.subject.description,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontText,
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.subject.hoursWeek.toString() +
                                      " Hours/week",
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontText,
                                  ),
                                ),
                                Text(
                                  widget.subject.priority.toString(),
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontText + 2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
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
