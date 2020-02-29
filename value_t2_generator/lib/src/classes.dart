import 'package:dartx/dartx.dart';

class NameType {
  final String type;
  final String name;

  NameType(this.name, String type) //
      : type = type == null ? null : type.replaceAll("\$", "");

  toString() => "${this.name}|${this.type}";
}

class ClassDef {
  final bool isAbstract;
  final String name;
  final List<NameType> fields;
  final List<GenericType> generics;

  ClassDef(this.isAbstract, this.name, this.fields, this.generics);
}

class GenericType {
  final String name;
  final String baseType;

  GenericType(this.name, this.baseType);
}

class Interface {
  final String type;
  final List<String> typeParams;

  Interface(String type, List typeParams)
      : type = type.replaceAll("\$", ""),
        typeParams = typeParams.map((e) => e.toString().replaceAll("\$", "")).toList();

  toString() => "${this.type}|${this.typeParams}";
}

/*

///For properties on a class
class ClassType {
  final String name;
  final List<NameType> fields;
  final List<GenericType> generics;

  ClassType(this.name, this.fields, this.generics);
}

//Our definition of a class
class ClassOurDefinition implements ClassType {
  final bool isAbstract;
  final String name;
  final List<NameType> fields;
  final List<GenericType> generics;
  final List<Interface> interfaces;

  ClassOurDefinition(this.isAbstract, this.name, this.fields, this.generics, this.interfaces);
}

class Interface implements ClassType {
  final String name;
  final List<NameType> fields;
  final List<GenericType> generics;
  final List<Interface> interfaces;

  Interface(this.name, this.fields, this.generics, this.interfaces);
}





 */
//
//class ClassDefWithGenericTypes extends ClassDef {
//  final List<GenericType> generics;
//
//  ClassDefWithGenericTypes({
//    @required this.generics,
//    @required bool isAbstract,
//    @required String name,
//    @required List<NameType> fields,
//  }) : super(isAbstract, name, fields);
//}
//
