import 'package:dartx/dartx.dart';
import 'package:value_t2_generator/src/classes.dart';

String getClassDefinition(bool isAbstract, String className) {
  var _className = className.replaceAll("\$", "");
  var abstract = isAbstract ? "abstract " : "";

  return "${abstract}class $_className";
}

String getClassGenerics(List<NameType> generics) {
  if(generics.isEmpty) //
    return "";

  var _generics = generics.map((e) {
    if (e.type == null) //
      return e.name;

    return "${e.name} extends ${e.type}";
  }).joinToString(separator: ", ");

  return "<$_generics>";
}

String getImplements(List<Interface> interfaces) {
  if (interfaces.length == 0) //
    return "";

  var types = interfaces.map((e) {
    if (e.typeParams.isEmpty) //
      return e.type;

    return "${e.type}<${e.typeParams.joinToString(separator: ", ")}>";
  }).joinToString(separator: ", ");

  return " implements $types";
}

String getProperties(List<NameType> fields) => //
    fields.map((e) => "final ${e.type} ${e.name};").join("\n");

String getPropertiesAbstract(List<NameType> fields) => //
    fields.map((e) => "${e.type} get ${e.name};").join("\n");

String getConstructorRows(List<NameType> fields) => //
    fields.map((e) => "@required this.${e.name},").join("\n").trim();

String getNullAsserts(List<NameType> fields) => //
    fields.map((e) => "assert(${e.name} != null)").joinToString(separator: ",\n") + ";";

//
//
//String getConstructorParams(
//  List<NameType> fields,
//  List<GenericType> generics,
//) {
//  return fields.map((e) => "@required this.${e.name}").joinToString(separator: ", ");
//}

//String getConstructorParams(
//  List<NameType> fields,
//  List<GenericType> generics,
//) {
//  var result = fields.where((x) {
//    var matchingGeneric = generics.firstWhere(
//        (g) => //
//            x.type == g.name || x.type.contains("<${g.name}>"),
//        orElse: () => null);
//
//    if (matchingGeneric == null || matchingGeneric.baseType.isNotNullOrEmpty()) {
//      return true;
//    }
//
//    return false;
//  }).toList();
//
//  var result2 = result.map((x) {
//    var matchingGeneric = generics.firstWhere(
//        (g) => //
//            x.type == g.name || x.type.contains("<${g.name}>"),
//        orElse: () => null);
//
//    if (matchingGeneric == null) {
//      return "${x.type} ${x.name}";
//    }
//
//    var type = x.type.replaceFirst(matchingGeneric.name, matchingGeneric.baseType);
//
//    return "${type} ${x.name}";
//  }) //
//      .joinToString(separator: ", ");
//
//  return result2.toString();
//}
//
//String getCopyWithSignature(
//  String className,
//  List<NameType> fields,
//  List<GenericType> generics,
//) {
//  var paramList = getCopyWithParamList(fields, generics);
//
//  var result = "$className cw$className({$paramList})";
//
//  return result;
//}
//
//String getPropertySetThis(String className, String fieldName) => //
//    "$fieldName: (this as $className).$fieldName";
//
//String getPropertySet(String name) => //
//    "$name: $name == null ? this.$name : $name";
//
//String getConstructorLines(ClassDef extType, ClassDef typeType) {
//  var result = typeType.fields.map((field) {
//    if (extType.fields.any((x) => field.name == x.name)) {
//      return getPropertySet(field.name);
//    } else {
//      return getPropertySetThis(typeType.name, field.name);
//    }
//  }).joinToString(separator: ",\n");
//
//  return result;
//}
//
//String getExtensionDef(String className) => //
//    "extension ${className}Ext_ValueT2 on ${className}";
