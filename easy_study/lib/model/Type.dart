class Type {
  final _value;
  const Type._internal(this._value);
  toString() => '$_value';

  static const VALUES = [ORAL_EXAM_, PRESENTATION, WRITTEN_EXAM];

  static const PRESENTATION = const Type._internal("Presentation");
  static const ORAL_EXAM_ = const Type._internal("Oral exam");
  static const WRITTEN_EXAM = const Type._internal("Written exam");
}