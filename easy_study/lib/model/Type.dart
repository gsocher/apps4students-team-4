class Type {
  final _value;
  const Type._internal(this._value);
  toString() => '$_value';

  static Type getType(String string){
    Map<String,Type> stringToType = new Map();
    stringToType["Presentation"] = Type.PRESENTATION;
    stringToType["Oral exam"] = Type.ORAL_EXAM;
    stringToType["Written exam"] = Type.WRITTEN_EXAM;
    if(!stringToType.containsKey(string)){
      throw new Exception("This type is not a valid Type");
    }
    return stringToType[string];

  }

  static const VALUES = [ORAL_EXAM, PRESENTATION, WRITTEN_EXAM];

  // TODO: 03.05.2019 Are there more types?
  static const PRESENTATION = const Type._internal("Presentation");
  static const ORAL_EXAM = const Type._internal("Oral exam");
  static const WRITTEN_EXAM = const Type._internal("Written exam");
}
