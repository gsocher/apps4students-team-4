class ExamType {
  final _value;

  const ExamType._internal(this._value);

  toString() => '$_value';

  static ExamType getType(String string) {
    Map<String, ExamType> stringToType = new Map();
    stringToType["Presentation"] = ExamType.PRESENTATION;
    stringToType["Oral exam"] = ExamType.ORAL_EXAM;
    stringToType["Written exam"] = ExamType.WRITTEN_EXAM;
    if (!stringToType.containsKey(string)) {
      throw Exception("This type is not a valid Type");
    }
    return stringToType[string];
  }

  static const VALUES = [ORAL_EXAM, PRESENTATION, WRITTEN_EXAM];

  static const PRESENTATION = const ExamType._internal("Presentation");
  static const ORAL_EXAM = const ExamType._internal("Oral exam");
  static const WRITTEN_EXAM = const ExamType._internal("Written exam");
}
