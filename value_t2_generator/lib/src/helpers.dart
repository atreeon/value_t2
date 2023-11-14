//import 'package:analyzer_models/analyzer_models.dart';
import 'package:dartx/dartx.dart';
import 'package:generator_common/NameType.dart';
import 'package:generator_common/classes.dart';
// import 'package:meta/meta.dart';

String getClassComment(List<Interface> interfaces, String classComment) {
  var a = interfaces
      .where((e) => e is InterfaceWithComment && e.comment != classComment) //
      .map((e) {
    var interfaceComment = e is InterfaceWithComment && e.comment != null //
        ? "\n${e.comment}"
        : "";
    return "///implements [${e.interfaceName}]\n///\n$interfaceComment\n///";
  }).toList();

  a.insert(0, classComment + "\n///");

  return a.join("\n").trim() + "\n";
}

/// remove dollars from the property type allowing for functions where
/// the dollars need to remain
String removeDollarsFromPropertyType(String propertyType) {
  var regex = RegExp("Function\((.*)\)");
  var result = regex.allMatches(propertyType);

  if (result.isNotEmpty) {
    return propertyType;
  }

  return propertyType.replaceAll(RegExp(r"(?<!<)(?<!<\$)\$\$?"), "");
}

List<NameTypeClassComment> getDistinctFields(
  List<NameTypeClassComment> fieldsRaw,
  List<InterfaceWithComment> interfaces,
) {
  var fields = fieldsRaw.map((f) => NameTypeClassComment(f.name, f.type, f.className?.replaceAll("\$", ""), comment: f.comment));

  var interfaces2 = interfaces //
      .map((x) => Interface.fromGenerics(
            x.interfaceName.replaceAll("\$", ""),
            x.typeParams,
            x.fields,
          ))
      .toList();
//
//    return Interface2(interface.type.replaceAll("\$", ""), result);
//  }).toList();

  var sortedFields = fields.sortedBy((element) => element.className ?? "").toList();
  var distinctFields = sortedFields.distinctBy((element) => element.name).toList();

  var adjustedFields = distinctFields.map((classField) {
    var i = interfaces2.where((x) => x.interfaceName == classField.className).take(1).toList();
    if (i.length > 0) {
      var paramNameType = i[0]
          .typeParams
          .where((interfaceGeneric) => //
              interfaceGeneric.name == classField.type)
          .toList();
      if (paramNameType.length > 0) {
        var name = removeDollarsFromPropertyType(paramNameType[0].type!);
        return NameTypeClassComment(classField.name, name, null, comment: classField.comment);
      }
    }

    var type = removeDollarsFromPropertyType(classField.type!);
    return NameTypeClassComment(classField.name, type, null, comment: classField.comment);
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

String getImplements(List<Interface> interfaces, String className) {
  if (interfaces.isEmpty) {
    return "";
  }

  var types = interfaces.map((e) {
    var type = e.interfaceName.replaceAll("\$", "");

    if (e.typeParams.isEmpty) {
      return type;
    }

    return "${type}<${e.typeParams.map((e) => e.type).joinToString(separator: ", ")}>";
  }).joinToString(separator: ", ");

  return " implements $types";
}

String getEnumPropertyList(List<NameTypeClassComment> fields, String className) {
  if (fields.isEmpty) //
    return '';

  var first = "enum ${className.replaceAll("\$", "")}\$ {";
  var last = fields.map((e) => e.name).join(",") + "}";
  return first + last;
}

/// remove dollars from the dataType except for function types
String getDataTypeWithoutDollars(String type) {
  var regex = RegExp("Function\((.*)\)");
  var result = regex.allMatches(type);

  if (result.isNotEmpty) {
    return type;
  }

  return type.replaceAll("\$", "");
}

String getProperties(List<NameTypeClassComment> fields) => //
    fields
        .map((e) => //
            e.comment == null
                ? "final ${getDataTypeWithoutDollars(e.type ?? "")} ${e.name};" //
                : "${e.comment}\nfinal ${e.type} ${e.name};")
        .join("\n");

String getPropertiesAbstract(List<NameTypeClassComment> fields) => //
    fields
        .map((e) => //
            e.comment == null
                ? "${getDataTypeWithoutDollars(e.type ?? "")} get ${e.name};" //
                : "${e.comment}\n${e.type} get ${e.name};")
        .join("\n");

String getConstructorRows(List<NameType> fields) => //
    fields
        .map((e) {
          if (e.type!.contains("?")) {
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

  var items = fields.map((e) => "${e.name}:\${${e.name}.toString()}").joinToString(separator: "|");
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

  sb.write(fields.map((e) {
    if ((e.type!.characters.take(5).string == "List<" || e.type!.characters.take(4).string == "Set<")) {
      //todo: hack here, a nullable entry won't compare properly to an empty list
      if (e.type!.characters.last == "?") {
        return "(${e.name}??[]).equalUnorderedD(other.${e.name}??[])";
      } else {
        return "(${e.name}).equalUnorderedD(other.${e.name})";
      }
    }

    return "${e.name} == other.${e.name}";
  }).joinToString(separator: " && "));

  sb.write(";");

  return sb.toString();
}

///[classFields] & [interfaceFields] should be renamed
/// for copyTo [classFields] and [className] is what we are copying from
/// and [interfaceFields] and [interfaceName] is what we are copying to
/// [classFields] can be an interface & [interfaceFields] can be a class!
String getCopyWith({
  required List<NameType> classFields,
  required List<NameType> interfaceFields,
  required String interfaceName,
  required String className,
  required bool isClassAbstract,
  required List<NameType> interfaceGenerics,
  bool isExplicitSubType = false, //for where we specify the explicit subtypes for copyTo
}) {
  var sb = StringBuffer();
  // sb.writeln("//${classFields}|${interfaceFields}|$interfaceName|$className");

  var classNameTrimmed = className.replaceAll("\$", "");
  var interfaceNameTrimmed = interfaceName.replaceAll("\$", "");

  isExplicitSubType //
      ? sb.write("$interfaceNameTrimmed copyTo${interfaceNameTrimmed}")
      : sb.write("$classNameTrimmed cw$interfaceNameTrimmed");

  if (interfaceGenerics.isNotEmpty) {
    var generic = interfaceGenerics //
        .map((e) => e.type == null //
            ? e.name
            : "${e.name} extends ${e.type}")
        .joinToString(separator: ", ");
    sb.write("<$generic>");
  }

  sb.write("(");

  //where property name of interface is the same as the one in the class
  //use the type of the class

  var fieldsForSignature = classFields //
      .where((element) => interfaceFields.map((e) => e.name).contains(element.name));

  // identify fields in the interface not in the class
  var requiredFields = isExplicitSubType //
      ? interfaceFields //
          .where((x) => classFields.none((cf) => cf.name == x.name))
          .toList()
      : <NameType>[];

  if (fieldsForSignature.isNotEmpty || requiredFields.isNotEmpty) //
    sb.write("{");

  sb.writeln();

  sb.write(requiredFields.map((e) {
    var interfaceType = interfaceFields.firstWhere((element) => element.name == e.name).type;
    return "required ${getDataTypeWithoutDollars(interfaceType!)} ${e.name},\n";
  }).join());

  sb.write(fieldsForSignature.map((e) {
    var interfaceType = interfaceFields.firstWhere((element) => element.name == e.name).type;
    return "Opt<${getDataTypeWithoutDollars(interfaceType!)}>? ${e.name},\n";
  }).join());

  if (fieldsForSignature.isNotEmpty) //
    sb.write("}");

  if (isClassAbstract && !isExplicitSubType) {
    sb.write(");");
    return sb.toString();
  }

  sb.writeln(") {");

  if (isExplicitSubType) {
    sb.writeln("return ${getDataTypeWithoutDollars(interfaceName)}(");
  } else {
    if (className.endsWith("_")) {
      sb.writeln("return $classNameTrimmed._(");
    } else {
      sb.writeln("return $classNameTrimmed(");
    }
  }

  sb.write(requiredFields //
      .map((e) {
    var classType = getDataTypeWithoutDollars(e.type!);
    return "${e.name}: ${e.name} as $classType,\n";
  }).join());

  sb.write(fieldsForSignature //
      .map((e) {
    var classType = getDataTypeWithoutDollars(classFields.firstWhere((element) => element.name == e.name).type!);
    return "${e.name}: ${e.name} == null ? this.${e.name} as $classType : ${e.name}.value as $classType,\n";
  }).join());

  var fieldsNotInSignature = classFields //
      .where((element) => !interfaceFields.map((e) => e.name).contains(element.name));

  sb.write(fieldsNotInSignature //
      .map((e) => "${e.name}: (this as $classNameTrimmed).${e.name},\n")
      .join());

  sb.writeln(");");
  sb.write("}");

  return sb.toString();
}

//String getCopyWithSignature(List<NameType> fields, String trimmedClassName) {
//  var paramList = "\n" + fields.map((e) => "required ${e.type} ${e.name}").joinToString(separator: ",\n") + ",\n";
//  return "$trimmedClassName cw$trimmedClassName({$paramList}) {";
//}

//List<Interface> getValueTImplements(List<Interface> interfaces, String trimmedClassName, List<NameType> fields) {
//  return [
//    ...interfaces //
//        .where((element) => element.type.startsWith("\$"))
//        .toList(),
//    Interface(trimmedClassName, typeArgsTypes, fields)
//  ];
//}

//class Interface2 {
//  final String type;
//  final List<NameType> paramNameType;
//
//  Interface2(this.type, this.paramNameType);
//
//  toString() => "${this.type}|${this.paramNameType}";
//}

String getConstructorName(String trimmedClassName) {
  return trimmedClassName[trimmedClassName.length - 1] == "_" ? "$trimmedClassName._" : trimmedClassName;
}
