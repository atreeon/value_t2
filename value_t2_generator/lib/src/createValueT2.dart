import 'package:generator_common/NameType.dart';
import 'package:generator_common/classes.dart';
import 'package:value_t2_generator/src/helpers.dart';

String createValueT2(
  bool isAbstract,
  List<NameTypeClassComment> allFields,
  String className,
  String classComment,
  List<Interface> interfacesFromImplements,
  List<Interface> interfacesAllInclSubInterfaces,
  List<NameTypeClassComment> classGenerics,
  bool hasConstContructor,
) {
  //recursively go through otherClasses and get my fieldnames &

  var sb = StringBuffer();

  sb.write(getClassComment(interfacesFromImplements, classComment));
  sb.write(getClassDefinition(isAbstract, className));

  if (classGenerics.isNotEmpty) {
    sb.write(getClassGenerics(classGenerics));
  }

  sb.write(" extends ${className}");

  if (classGenerics.isNotEmpty) {
    sb.write(getExtendsGenerics(classGenerics));
  }
  if (interfacesFromImplements.isNotEmpty) {
    sb.write(getImplements(interfacesFromImplements, className));
  }
  sb.writeln(" {");
  var classNameTrim = className.replaceAll("\$", "");
  var constructorName = getConstructorName(classNameTrim);
  if (isAbstract) {
    sb.writeln(getPropertiesAbstract(allFields));
  } else {
    sb.writeln(getProperties(allFields));
    sb.write(getClassComment(interfacesFromImplements, classComment));

    if (allFields.isEmpty) {
      sb.writeln("${constructorName}();");
    } else {
      sb.writeln("${constructorName}({");
      sb.writeln(getConstructorRows(allFields));
      sb.writeln("});");

      if (hasConstContructor) {
        sb.writeln("const ${constructorName}.constant({");
        sb.writeln(getConstructorRows(allFields));
        sb.writeln("});");
      }
      sb.writeln(getToString(allFields, classNameTrim));
    }

    sb.writeln(getHashCode(allFields));
    sb.writeln(getEquals(allFields, classNameTrim));
  }
//
  var interfacesX = [
    ...interfacesAllInclSubInterfaces,
    Interface.fromGenerics(
      className,
      classGenerics.map((e) => NameType(e.name, e.type)).toList(),
      allFields,
    ),
  ];

  interfacesX.where((element) => !element.isExplicitSubType).forEach((x) {
    sb.writeln(
      getCopyWith(
        classFields: allFields,
        interfaceFields: x.fields,
        interfaceName: x.interfaceName,
        className: className,
        isClassAbstract: isAbstract,
        interfaceGenerics: x.typeParams,
        isExplicitSubType: x.isExplicitSubType,
      ),
    );
  });

  sb.writeln("}");

  sb.writeln();
  sb.writeln("extension ${className}_copyTo_E on ${className} {");

  interfacesX.where((element) => element.isExplicitSubType).forEach((x) {
    sb.writeln(
      getCopyWith(
        classFields: allFields,
        interfaceFields: x.fields,
        interfaceName: x.interfaceName,
        className: className,
        isClassAbstract: isAbstract,
        interfaceGenerics: x.typeParams,
        isExplicitSubType: x.isExplicitSubType,
      ),
    );
  });
  sb.writeln("}");

  sb.writeln(getEnumPropertyList(allFields, className));

  return sb.toString();
}
