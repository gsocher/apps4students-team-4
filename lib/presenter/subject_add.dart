import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SubjectAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubjectAddState();
}

class _SubjectAddState extends State<SubjectAdd> {
  HSVColor color = new HSVColor.fromColor(Colors.blue);

  void onChanged(HSVColor value) => this.color = value;

  static const String TITLE = 'title';
  static const String ROOM = 'room';
  static const String DESCRIPTION = 'descprition';
  static const String HOURS_PER_WEEK = 'hours per week';
  final formKey = GlobalKey<FormState>();
  String _title, _room, _description, _hoursPerWeek;
  Priority _priority;
  ExamType _type;

  // TODO: 03.05.2019 rework the whole build method. Most code is used twice.
  // TODO: 03.05.2019 Is there a strings.xml? If yes use it.
  // TODO: 16.05.2019 if the dropdown is not chosen, it wont work. Fix it.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
                key: formKey,
                child: ListView.builder(
                    itemBuilder: _buildColumnItems,
                    itemCount: 1,
                    scrollDirection: Axis.vertical))));
  }

  Subject _submit() {
    Subject result;
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      result = Subject.name(_title, _type, _room, _priority, _description,
          int.parse(_hoursPerWeek));
      result.color = color.toColor();
    }
    return result;
  }

  Widget _buildColumnItems(BuildContext context, int index) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextFormField(
            validator: (String input) =>
                input.length <= 0 ? 'please enter a  $TITLE' : null,
            onSaved: (String value) => _title = value,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                border: UnderlineInputBorder(),
                filled: true,
                alignLabelWithHint: true,
                labelText: TITLE),
          ),
          TextFormField(
            validator: (String input) =>
                input.length <= 0 ? 'please enter a $ROOM' : null,
            onSaved: (String value) => _room = value,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                border: UnderlineInputBorder(),
                filled: true,
                alignLabelWithHint: true,
                labelText: ROOM),
          ),
          TextFormField(
            validator: (String input) =>
                input.length <= 0 ? 'please enter a $DESCRIPTION' : null,
            onSaved: (String value) => _description = value,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                border: UnderlineInputBorder(),
                filled: true,
                alignLabelWithHint: true,
                labelText: DESCRIPTION),
          ),
          DropdownButton<ExamType>(
              value: _type,
              items: ExamType.VALUES
                  .map((value) => new DropdownMenuItem<ExamType>(
                        child: Text(value.toString()),
                        value: value,
                      ))
                  .toList(),
              onChanged: (ExamType value) => setState(() {
                    _type = value;
                  })),
          DropdownButton<Priority>(
              value: _priority,
              items: Priority.VALUES
                  .map((value) => new DropdownMenuItem<Priority>(
                        child: Text(value.toString()),
                        value: value,
                      ))
                  .toList(),
              onChanged: (Priority value) => setState(() {
                    _priority = value;
                  })),
          TextFormField(
            validator: (String input) =>
                input.length <= 0 ? 'please enter the $HOURS_PER_WEEK' : null,
            onSaved: (String value) => _hoursPerWeek = value,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                border: UnderlineInputBorder(),
                filled: true,
                alignLabelWithHint: true,
                labelText: HOURS_PER_WEEK),
            keyboardType: TextInputType.number,
            autovalidate: true,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(top: 20),
            width: 500,
            height: 400,
            child: Column(children: <Widget>[
              Text(
                'choose the subjects color:',
                style: TextStyle(fontSize: 25.0),
              ),
              new PaletteValuePicker(
                color: this.color,
                onChanged: (value) =>
                    super.setState(() => this.onChanged(value)),
              )
            ]),
          ),
          //TODO: 19.05.2019 check if all inputs are correct before saving.
          new StoreConnector<AppState, VoidCallback>(converter: (store) {
            return () => store..dispatch(AddNewSubject(_submit()));
          }, builder: (context, callback) {
            return new IconButton(
              icon: Icon(
                Icons.save,
                size: 30,
              ),
              onPressed: callback,
            );
          })
        ]);
  }
}
