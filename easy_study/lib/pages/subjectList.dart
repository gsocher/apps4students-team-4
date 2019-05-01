import 'package:easy_study/pages/addSubject.dart';
import 'package:easy_study/widgets/subjectCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SubjectListState();
  }


class _SubjectListState extends State<SubjectList>{

  Widget build(BuildContext context) {
    return
      new Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(
                child: Icon(Icons.add, color: Colors.white),
                onPressed: ()=> _addPage(context, SubjectAdd()),
              ),
            ],
          ),
          body: new ListView(
            children: <Widget>[
              new SubjectCard(
                'title',
              ),
            ],
          )

    );
  }

  static void _addPage(BuildContext context, Widget widget) {
    Navigator.pop(context); //remove a page from the widget stack (close navigation)
    Navigator.pushReplacement( //replace the top view(widget) from the stack with the new one
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}