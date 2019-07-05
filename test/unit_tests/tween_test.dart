import 'package:easy_study/model/subject.dart';
import 'package:easy_study/testhelper/test_helper.dart';
import 'package:easy_study/view/progress_summary.dart';
import 'package:easy_study/view/tween.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const size = const Size(380, 30.0);
  List<Subject> subjects = new List<Subject>();
  List<Subject> subjects2 = new List<Subject>();

  test('merge tween case 1', () {
    subjects.add(TestHelper.getDummySubject());
    subjects.add(TestHelper.getDummySubject2());
    subjects.add(TestHelper.getDummySubject());
    subjects.add(TestHelper.getDummySubject2());

    subjects.add(TestHelper.getDummySubject());

    MergeTween<BarStack>(
        BarChart.create(size, subjects2).stacks, BarChart.empty(size).stacks);
  });

  test('merge tween case 2 and 3', () {
    subjects.add(TestHelper.getDummySubject());
    subjects.add(TestHelper.getDummySubject2());
    subjects.add(TestHelper.getDummySubject());
    subjects.add(TestHelper.getDummySubject2());

    MergeTween<BarStack>(BarChart.create(size, subjects2).stacks,
        BarChart.create(size, subjects).stacks);
  });

  test('tween lerp', () {
    MergeTween mt = MergeTween<BarStack>(BarChart.create(size, subjects).stacks,
        BarChart.create(size, subjects2).stacks);
    mt.lerp(2);
  });
}
