
import 'package:easy_study/pages/subjectList.dart';
import 'package:easy_study/widgets/subjectCard.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

    home:SubjectList(),
    );
  }
}

