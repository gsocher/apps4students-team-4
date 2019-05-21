// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:easy_study/model/Priority.dart';
import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/model/Type.dart';
import 'package:easy_study/store/AppState.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final newState = searchReducer(new AppState.initial(), AddNewSubject(Subject.name("Software Engineering II", Type.WRITTEN_EXAM,
        "T1.011", Priority.MINIMALISM, "A funny subject.", 5)));

    // this test is not working
    expect(newState, 1);
  });
}
