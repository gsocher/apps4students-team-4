class Priority {
  final _value;
  const Priority._internal(this._value);
  toString() => '$_value';

  static const VALUES = [WANT_TO_PASS, MINIMALISM, NORMAL];

  static const WANT_TO_PASS = const Priority._internal("Want to pass!");
  static const MINIMALISM = const Priority._internal("Minimalism");
  static const NORMAL = const Priority._internal("Normal");
}