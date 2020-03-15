class NameTypeClass {
  final String type;
  final String name;
  final String class_;

  NameTypeClass(this.name, String type, String class_) //
      : type = type == null ? null : type.replaceAll("\$", ""),
        class_ = class_ == null ? null : class_.replaceAll("\$", "");

  toString() => "${this.name}:${this.type}:${this.class_}";
}

class NameType {
  final String type;
  final String name;

  NameType(this.name, String type) //
      : type = type == null ? null : type.replaceAll("\$", "");

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
  final List<String> typeArgs;
  final List<String> typeParams;

  Interface(String type, this.typeArgs, this.typeParams)
      : type = type.replaceAll("\$", "") {
    assert(this.typeArgs.length == this.typeParams.length, "typeArgs must have same length as typeParams");
  }

  toString() => "${this.type}|${this.typeArgs}|${this.typeParams}";
}

class Interface2 {
  final String type;
  final List<NameType> paramNameType;

  Interface2(this.type, this.paramNameType);

  toString() => "${this.type}|${this.paramNameType}";
}
