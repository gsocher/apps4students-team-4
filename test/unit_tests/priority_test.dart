// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:easy_study/model/priority.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('priority getPriority Want to pass!', () {
    var result = Priority.getPriority("Want to pass!");
    var compare = Priority.WANT_TO_PASS;
    expect(result, compare);
  });

  test('priority getPriority Minimalism', () {
    var result = Priority.getPriority("Minimalism");
    var compare = Priority.MINIMALISM;
    expect(result, compare);
  });

  test('priority getPriority Normal', () {
    var result = Priority.getPriority("Normal");
    var compare = Priority.NORMAL;
    expect(result, compare);
  });
}
