import 'dart:ui';

import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';

class Subject {
  String _title, _room, _description;
  int _id, _timeSpent = 0, _hoursWeek;
  ExamType _type;
  Priority _priority;
  Color _color = Color.fromARGB(255, 0, 0, 0);

  // TODO: 02.05.2019 Change due date. For now its today or right now.
  DateTime _dueDate = DateTime.now();

  // TODO: 02.05.2019 refactor to initialization and naming
  Subject.name(this._title, this._type, this._room, this._priority,
      this._description, this._hoursWeek);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  set color(Color value) {
    _color = value;
  }

  int get hoursWeek => _hoursWeek;

  DateTime get dueDate => _dueDate;

  int get timeSpent => _timeSpent;

  Color get color => _color;

  String get description => _description;

  Priority get priority => _priority;

  String get room => _room;

  ExamType get type => _type;

  String get title => _title;

  //puts the ObjectVariables to a map so the database can read it easily
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['type'] = _type.toString();
    map['room'] = _room;
    map['priority'] = _priority.toString();
    map['description'] = _description;
    map['hoursWeek'] = _hoursWeek;
    map['color_alpha'] = _color.alpha;
    map['color_red'] = _color.red;
    map['color_green'] = _color.green;
    map['color_blue'] = _color.blue;

    print("color alpha" + _color.alpha.toString());

    return map;
  }

  @override
  String toString() {
    return 'Subject{_title: $_title, _room: $_room,'
        ' _description: $_description, _id: $_id, _timeSpent:'
        ' $_timeSpent, _hoursWeek: $_hoursWeek, _type: $_type, '
        '_priority: $_priority, _color: $_color, _dueDate: $_dueDate}';
  }
}
