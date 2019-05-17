import 'package:easy_study/model/Priority.dart';
import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/model/Type.dart';
import 'package:easy_study/view/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

class SubjectAdd extends StatefulWidget {
  final SubjectCallback onSubjectAdd;

  const SubjectAdd({this.onSubjectAdd});

  @override
  State<StatefulWidget> createState() => _SubjectAddState();
}

class _SubjectAddState extends State<SubjectAdd> {
  HSVColor color = new HSVColor.fromColor(Colors.blue);

  void onChanged(HSVColor value) => this.color = value;

  final String TITLE = 'title';
  final String ROOM = 'room';
  final String DESCRIPTION = 'descprition';
  final String HOURSPERWEEK = 'hours per week';
  final formKey = GlobalKey<FormState>();
  String _title, _room, _description, _hoursPerWeek;
  Priority _priority;
  Type _type;

  // TODO: 03.05.2019 rework the whole build method. Most code is used twice.
  // TODO: 03.05.2019 Is there a strings.xml? If yes use it.
  // TODO: 16.05.2019 if the dropdown is not choosen, it wont work. Fix it.
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

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Subject result = Subject.name(_title, _type, _room, _priority,
          _description, int.parse(_hoursPerWeek));
      result.color = color.toColor();
      widget.onSubjectAdd(result);
    }
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
          DropdownButton<Type>(
              value: _type,
              items: Type.VALUES
                  .map((value) => new DropdownMenuItem<Type>(
                        child: Text(value.toString()),
                        value: value,
                      ))
                  .toList(),
              onChanged: (Type value) => setState(() {
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
                input.length <= 0 ? 'please enter the $HOURSPERWEEK' : null,
            onSaved: (String value) => _hoursPerWeek = value,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                border: UnderlineInputBorder(),
                filled: true,
                alignLabelWithHint: true,
                labelText: HOURSPERWEEK),
            keyboardType: TextInputType.number,
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 20),
              width: 500,
              height: 400,
              child: Column(
                children: <Widget>[
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
          IconButton(
            icon: Icon(
              Icons.save,
              size: 30,
            ),
            onPressed: _submit,
          )
        ]);
  }
}
