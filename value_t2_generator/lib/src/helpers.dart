import 'package:analyzer_models/analyzer_models.dart';
import 'package:dartx/dartx.dart';

String removeDollarsFromPropertyType(String propertyType) {
  return propertyType.replaceAll(RegExp(r"(?<!<)(?<!<\$)\$\$?"), "");
}

List<NameType> getDistinctFields(
  List<NameTypeClass> fieldsRaw,
  List<Interface> interfaces,
) {
  var fields = fieldsRaw.map((f) => NameTypeClass(f.name, f.type, f.class_.replaceAll("\$", "")));

  var interfaces2 = interfaces.map((interface) {
    var result = List<NameType>();

    for (var i = 0; i < interface.typeParamsNames.length; i++) {
      result.add(NameType(interface.typeArgsTypes[i], interface.typeParamsNames[i]));
    }

    return Interface2(interface.type.replaceAll("\$", ""), result);
  }).toList();

  var sortedFields = fields.sortedBy((element) => element.class_).toList();
  var distinctFields = sortedFields.distinctBy((element) => element.name).toList();

  var adjustedFields = distinctFields.map((f) {
    var i = interfaces2.firstWhere((i) => i.type == f.class_, orElse: () => null);
    if (i != null) {
      var paramNameType = i.paramNameType.firstWhere((p) => p.type == f.type, orElse: () => null);
      if (paramNameType != null) {
        var name = removeDollarsFromPropertyType(paramNameType.name);
        return NameType(f.name, name);
      }
    }

    var type = removeDollarsFromPropertyType(f.type);
    return NameType(f.name, type);
  }).toList();

  return adjustedFields;
}

String getClassDefinition(bool isAbstract, String className) {
  var _className = className.replaceAll("\$", "");
  var abstract = isAbstract ? "abstract " : "";

  return "${abstract}class $_className";
}

String getClassGenerics(List<NameType> generics) {
  if (generics.isEmpty) {
    return "";
  }

  var _generics = generics.map((e) {
    if (e.type == null) {
      return e.name;
    }

    return "${e.name} extends ${e.type}";
  }).joinToString(separator: ", ");

  return "<$_generics>";
}

String getExtendsGenerics(List<NameType> generics) {
  if (generics.isEmpty) {
    return "";
  }

  var _generics = generics //
      .map((e) => e.name)
      .joinToString(separator: ", ");

  return "<$_generics>";
}

String getImplements(List<Interface> interfaces) {
  if (interfaces.isEmpty) {
    return "";
  }

  var types = interfaces.map((e) {
    var type = e.type.replaceAll("\$", "");

    if (e.typeArgsTypes.isEmpty) {
      return type;
    }

    return "${type}<${e.typeArgsTypes.joinToString(separator: ", ")}>";
  }).joinToString(separator: ", ");

  return " implements $types";
}

String getProperties(List<NameType> fields) => //
    fields.map((e) => "final ${e.type} ${e.name};").join("\n");

String getPropertiesAbstract(List<NameType> fields) => //
    fields.map((e) => "${e.type} get ${e.name};").join("\n");

String getConstructorRows(List<NameType> fields, List<String> nullableFieldNames) => //
    fields
        .map((e) {
          if (nullableFieldNames.indexOf(e.name) >= 0) {
            return "this.${e.name},";
          }

          return "@required this.${e.name},";
        })
        .join("\n")
        .trim();

String getNullAsserts(List<NameType> fields, List<String> nullableFieldNames) => //
    fields //
        .where((e) => nullableFieldNames.indexOf(e.name) == -1)
        .map((e) => "assert(${e.name} != null)")
        .joinToString(separator: ",\n") +
    ";";

String getToString(List<NameType> fields, String className) {
  if (fields.isEmpty) {
    return """String toString() => "($className-)""";
  }

  var items = fields.map((e) => "${e.name}:\$${e.name}").joinToString(separator: "|");
  return """String toString() => "($className-$items)";""";
}

String getHashCode(List<NameType> fields) {
  if (fields.isEmpty) {
    return "";
  }

  var items = fields.map((e) => "${e.name}.hashCode").joinToString(separator: ", ");
  return """int get hashCode => hashObjects([$items]);""";
}

String getEquals(List<NameType> fields, String className) {
  var sb = StringBuffer();

  sb.write("bool operator ==(Object other) => identical(this, other) || other is $className && runtimeType == other.runtimeType");

  sb.writeln(fields.isEmpty ? "" : " &&");

  sb.write(fields.map((e) => "${e.name} == other.${e.name}").joinToString(separator: " && "));

  sb.write(";");

  return sb.toString();
}

class Interface2 {
  final String type;
  final List<NameType> paramNameType;

  Interface2(this.type, this.paramNameType);

  toString() => "${this.type}|${this.paramNameType}";
}

String getConstructorName(String trimmedClassName) {
  return trimmedClassName[trimmedClassName.length - 1] == "_" ? "$trimmedClassName._" : trimmedClassName;
}
