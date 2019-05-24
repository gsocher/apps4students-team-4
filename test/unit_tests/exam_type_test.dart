// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:easy_study/model/exam_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('exam type getType presentation', () {
    var result = ExamType.getType("Presentation");
    var compare = ExamType.PRESENTATION;
    expect(result, compare);
  });

  test('exam type getType oral exam', () {
    var result = ExamType.getType("Oral exam");
    var compare = ExamType.ORAL_EXAM;
    expect(result, compare);
  });

  test('exam type getType Written exam', () {
    var result = ExamType.getType("Written exam");
    var compare = ExamType.WRITTEN_EXAM;
    expect(result, compare);
  });
}
