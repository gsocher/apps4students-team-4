import 'package:easy_study/Database/DBHelper.dart';
import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/view/SubjectCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectOverview extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SubjectOverviewState();
}

class _SubjectOverviewState extends State<SubjectOverview> {

  Future<List<Subject>> _getSubjectsFromDB() async {
    var dbHelper = DBHelper();
    var result = await dbHelper.getSubjects();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Subject>>(
        future: _getSubjectsFromDB(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return new SubjectCard(snapshot.data[index]);
                  });
            }
          }
            return new Container(
              alignment: AlignmentDirectional.center,
              child: new CircularProgressIndicator(),
            );

        },
      ),
    );
  }
}
