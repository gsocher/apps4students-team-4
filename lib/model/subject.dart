import 'dart:ui';

import 'package:easy_study/model/exam_type.dart';
import 'package:easy_study/model/priority.dart';

class Subject {
  String title, room, description;
  int id, timeSpent = 0, hoursWeek;
  ExamType type;
  Priority priority;
  Color color = Color.fromARGB(255, 0, 0, 0);

  // TODO: 02.05.2019 Change due date. For now its today or right now.
  DateTime dueDate = DateTime.now();

  // TODO: 02.05.2019 refactor to initialization and naming
  Subject.name(this.title, this.type, this.room, this.priority,
      this.description, this.hoursWeek);

  //puts the ObjectVariables to a map so the database can read it easily
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['type'] = type.toString();
    map['room'] = room;
    map['priority'] = priority.toString();
    map['description'] = description;
    map['hoursWeek'] = hoursWeek;
    map['color_alpha'] = color.alpha;
    map['color_red'] = color.red;
    map['color_green'] = color.green;
    map['color_blue'] = color.blue;

    print("color alpha" + color.alpha.toString());

    return map;
  }

  @override
  String toString() {
    return 'Subject{_title: $title, _room: $room,'
        ' _description: $description, _id: $id, _timeSpent:'
        ' $timeSpent, _hoursWeek: $hoursWeek, _type: $type, '
        '_priority: $priority, _color: $color, _dueDate: $dueDate}';
  }
}
