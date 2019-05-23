class Priority {
  final _value;

  const Priority._internal(this._value);

  toString() => '$_value';

  static Priority getPriority(String string) {
    Map<String, Priority> stringToPrio = new Map();
    stringToPrio["Want to pass!"] = Priority.WANT_TO_PASS;
    stringToPrio["Minimalism"] = Priority.MINIMALISM;
    stringToPrio["Normal"] = Priority.NORMAL;
    if (!stringToPrio.containsKey(string)) {
      throw new Exception("This priority is not a valid Priority");
    }
    return stringToPrio[string];
  }

  static const VALUES = [WANT_TO_PASS, MINIMALISM, NORMAL];

  // TODO: 03.05.2019 Think about the priority constants. Are these good equivalents for students?
  static const WANT_TO_PASS = const Priority._internal("Want to pass!");
  static const MINIMALISM = const Priority._internal("Minimalism");
  static const NORMAL = const Priority._internal("Normal");
}
