import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

class SubjectAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SubjectAddState();
}

class SubjectAddState extends State<SubjectAdd> {
  HSVColor color = new HSVColor.fromColor(Colors.blue);

  void onChanged(HSVColor value) => this.color = value;

  static const String TITLE = 'title';
  static const String ROOM = 'room';
  static const String DESCRIPTION = 'descprition';
  static const String HOURS_PER_WEEK = 'hours per week';
  static const String DUE_DATE = 'Due Date';
  static const String PRIORITY = 'Priority';
  static const String TYPE = 'Type';
  final dateFormat = DateFormat("EE, yyyy-MM-dd 'at' h:mm a");
  final formKey = GlobalKey<FormState>();
  String _title, _room, _description, _hoursPerWeek;
  Priority _priority;
  ExamType _type;
  DateTime _dateTime;
  bool isValidated;

  void initState() {
    super.initState();
    isValidated = false;
    _priority = Priority.NORMAL;
    _type = ExamType.WRITTEN_EXAM;
  }

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
                    itemBuilder: buildColumnItems,
                    itemCount: 1,
                    scrollDirection: Axis.vertical))));
  }

  Subject submit() {
    Subject result;
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      result = new Subject.name(_title, _type, _room, _priority, _description,
          int.parse(_hoursPerWeek), _dateTime, DateTime.now());
      result.color = color.toColor();
      setState(() {
        isValidated = false;
      });
    }
    return result;
  }

  void checkIfInputIsValid() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        isValidated = true;
      });
    } else {
      showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Please check your input again'),
              actions: <Widget>[
                FlatButton(
                  child: const Text('Okay'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                )
              ]);
        },
      );
    }
  }

  String validateDueDate(DateTime duedate) {
    if (duedate == null) {
      return '$DUE_DATE must not be empty.';
    }
    if (duedate.isBefore(DateTime.now())) {
      return 'the date must be ahead of now';
    }
    return null;
  }

  Widget buildColumnItems(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextFormField(
          validator: (String input) =>
              input.length <= 0 ? 'please enter a  $TITLE' : null,
          onFieldSubmitted: (String value) {
            setState(() {
              isValidated = false;
            });
          },
          onSaved: (String value) => _title = value,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: UnderlineInputBorder(),
              filled: true,
              alignLabelWithHint: true,
              labelText: TITLE),
        ),
        SizedBox(height: 15.0),
        TextFormField(
          validator: (String input) =>
              input.length <= 0 ? 'please enter a $ROOM' : null,
          onFieldSubmitted: (String value) {
            setState(() {
              isValidated = false;
            });
          },
          onSaved: (String value) => _room = value,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: UnderlineInputBorder(),
              filled: true,
              alignLabelWithHint: true,
              labelText: ROOM),
        ),
        SizedBox(height: 15.0),
        TextFormField(
          validator: (String input) =>
              input.length <= 0 ? 'please enter a $DESCRIPTION' : null,
          onFieldSubmitted: (String value) {
            setState(() {
              isValidated = false;
            });
          },
          onSaved: (String value) => _description = value,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: UnderlineInputBorder(),
              filled: true,
              alignLabelWithHint: true,
              labelText: DESCRIPTION),
        ),
        SizedBox(height: 15.0),
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
        SizedBox(height: 15.0),
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
        SizedBox(height: 15.0),
        TextFormField(
          validator: (String input) =>
              input.length <= 0 ? 'please enter the $HOURS_PER_WEEK' : null,
          onFieldSubmitted: (String value) {
            setState(() {
              isValidated = false;
            });
          },
          onSaved: (String value) => _hoursPerWeek = value,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: UnderlineInputBorder(),
              filled: true,
              alignLabelWithHint: true,
              labelText: HOURS_PER_WEEK),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 15.0),
        Container(
            child: DateTimePickerFormField(
          format: this.dateFormat,
          dateOnly: false,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: UnderlineInputBorder(),
              filled: true,
              alignLabelWithHint: true,
              labelText: DUE_DATE),
          validator: validateDueDate,
          onFieldSubmitted: (DateTime value) {
            setState(() {
              isValidated = false;
            });
          },
          onChanged: (dueDate) => setState(() => _dateTime = dueDate),
        )),
        SizedBox(height: 15.0),
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
              onChanged: (value) => super.setState(() => this.onChanged(value)),
            )
          ]),
        ),
        SizedBox(height: 15.0),
        Visibility(
            visible: !isValidated,
            child: new IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.grey,
                size: 30,
              ),
              onPressed: () => checkIfInputIsValid(),
            )),
        Visibility(
            visible: isValidated,
            child:
                new StoreConnector<AppState, VoidCallback>(converter: (store) {
              return () => store..dispatch(AddNewSubject(submit()));
            }, builder: (context, callback) {
              return new IconButton(
                icon: Icon(
                  Icons.save,
                  size: 30,
                ),
                onPressed: callback,
              );
            }))
      ],
    );
  }
}
