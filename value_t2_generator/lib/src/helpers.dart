import 'package:analyzer_models/analyzer_models.dart';
import 'package:dartx/dartx.dart';
import 'package:value_t2_generator/src/classes.dart';

String getClassComment(List<Interface> interfaces, String classComment) {
  var a = interfaces.where((e) => e is InterfaceWithComment && e.comment != classComment) //
      .map((e) {
    var interfaceComment = e is InterfaceWithComment && e.comment != null //
        ? "\n${e.comment}"
        : "";
    return "///implements [${e.type}]\n///\n$interfaceComment\n///";
  }).toList();

  if (classComment != null) //
    a.insert(0, classComment + "\n///");

  return a.join("\n").trim() + "\n";
}

String removeDollarsFromPropertyType(String propertyType) {
  return propertyType.replaceAll(RegExp(r"(?<!<)(?<!<\$)\$\$?"), "");
}

List<NameTypeWithComment> getDistinctFields(
  List<NameTypeClassWithComment> fieldsRaw,
  List<Interface> interfaces,
) {
  var fields = fieldsRaw.map((f) => NameTypeClassWithComment(f.name, f.type, f.class_.replaceAll("\$", ""), comment: f.comment));

  var interfaces2 = interfaces.map((interface) {
    var result = <NameType>[];

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
        return NameTypeWithComment(f.name, name, comment: f.comment);
      }
    }

    var type = removeDollarsFromPropertyType(f.type);
    return NameTypeWithComment(f.name, type, comment: f.comment);
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

String getProperties(List<NameTypeWithComment> fields) => //
    fields
        .map((e) => //
            e.comment == null
                ? //
                "final ${e.type} ${e.name};" //
                : "${e.comment}\nfinal ${e.type} ${e.name};")
        .join("\n");

String getPropertiesAbstract(List<NameTypeWithComment> fields) => //
    fields
        .map((e) => //
            e.comment == null
                ? //
                "${e.type} get ${e.name};" //
                : "${e.comment}\n${e.type} get ${e.name};")
        .join("\n");

String getConstructorRows(List<NameType> fields) => //
    fields
        .map((e) {
          if (e.type.contains("?")) {
            return "this.${e.name},";
          }

          return "required this.${e.name},";
        })
        .join("\n")
        .trim();

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
