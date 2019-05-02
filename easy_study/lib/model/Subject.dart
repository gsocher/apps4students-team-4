import 'dart:ui';

import 'package:easy_study/model/Priority.dart';
import 'package:easy_study/model/Type.dart';

class Subject {

  String _title, _room, _description;
  int _timeSpent = 0, _hoursWeek;
  Type _type;
  Priority _priority;
  Color _color = Color.fromARGB(255, 0, 0, 0);
  // TODO: 02.05.2019 Change due date. For now its today or right now.
  DateTime _dueDate = DateTime.now();

  // TODO: 02.05.2019 refactor to initialization and naming
  Subject.name(
      this._title,
      this._type,
      this._room,
      this._priority,
      this._description,
      this._hoursWeek);

  int get hoursWeek => _hoursWeek;

  DateTime get dueDate => _dueDate;

  int get timeSpent => _timeSpent;

  Color get color => _color;

  String get description => _description;

  Priority get priority => _priority;

  String get room => _room;

  Type get type => _type;

  String get title => _title;
}
