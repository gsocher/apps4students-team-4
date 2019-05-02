import 'dart:ui';

import 'package:easy_study/model/Priority.dart';
import 'package:easy_study/model/Type.dart';

class Subject {
  String _title, _room, _description;
  Type _type;
  Priority _priority;

  int _timeSpent, _hoursWeek;
  Color _color;
  DateTime _dueDate;

  Subject.name(
      this._title,
      this._type,
      this._room,
      this._priority,
      this._description,
      this._color,
      this._timeSpent,
      this._dueDate,
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
