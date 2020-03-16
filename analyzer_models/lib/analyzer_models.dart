class NameTypeClass {
  final String type;
  final String name;
  final String class_;

  NameTypeClass(this.name, this.type, this.class_);

  toString() => "${this.name}:${this.type}:${this.class_}";
}

class NameType {
  final String type;
  final String name;

  NameType(this.name, this.type);

  toString() => "${this.name}:${this.type}";
}

class ClassDef {
  final bool isAbstract;
  final String name;
  final List<NameType> fields;
  final List<GenericType> generics;
  final List<String> baseTypes;

  ClassDef(
    this.isAbstract,
    this.name,
    this.fields,
    this.generics,
    this.baseTypes,
  );
}

class GenericType {
  final String name;
  final String baseType;

  GenericType(this.name, this.baseType);
}

class Interface {
  final String type;
  final List<String> typeArgsTypes;
  final List<String> typeParamsNames;

  Interface(this.type, this.typeArgsTypes, this.typeParamsNames) {
    assert(this.typeArgsTypes.length == this.typeParamsNames.length, "typeArgs must have same length as typeParams");
  }

  toString() => "${this.type}|${this.typeArgsTypes}|${this.typeParamsNames}";
}

