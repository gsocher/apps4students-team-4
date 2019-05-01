import 'package:easy_study/pages/subjectList.dart';
import 'package:easy_study/widgets/subjectCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SubjectAddState();
}


class _SubjectAddState extends State<SubjectAdd>{

  Widget build(BuildContext context) {
    return
      new Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: ()=> _addPage(context, SubjectList()),
            ),
            FlatButton(
              child: Icon(Icons.save, color: Colors.white),
            ),
          ],
        ),
        body: new TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText:
            'title',
          ),
        ),

      );
  }
    static void _addPage(BuildContext context, Widget widget) {
      Navigator.pop(context); //remove a page from the widget stack (close navigation)
      Navigator.pushReplacement( //replace the top view(widget) from the stack with the new one
          context, MaterialPageRoute(builder: (BuildContext context) => widget));
    }

  }