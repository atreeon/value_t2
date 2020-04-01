import 'package:analyzer_models/analyzer_models.dart';
import 'package:value_t2_generator/src/helpers.dart';

String createValueT2(
  bool isAbstract,
  List<NameType> allFields,
  String className,
  List<Interface> interfaces,
  List<NameType> classGenerics,
) {
  var sb = StringBuffer();
  sb.write(getClassDefinition(isAbstract, className));
  if (classGenerics.isNotEmpty) {
    sb.write(getClassGenerics(classGenerics));
  }
  sb.write(" extends ${className}");
  if (classGenerics.isNotEmpty) {
    sb.write(getExtendsGenerics(classGenerics));
  }
  if (interfaces.isNotEmpty) {
    sb.write(getImplements(interfaces));
  }
  sb.writeln(" {");
  var classNameTrim = className.replaceAll("\$", "");
  var constructorName = getConstructorName(classNameTrim);
  if (isAbstract) {
    sb.writeln(getPropertiesAbstract(allFields));
  } else if (allFields.isEmpty) {
    sb.writeln("${constructorName}();");
    sb.writeln(getHashCode(allFields));
    sb.writeln(getEquals(allFields, classNameTrim));
  } else {
    sb.writeln(getProperties(allFields));
    sb.writeln("${constructorName}({");
    sb.writeln(getConstructorRows(allFields));
    sb.writeln("}):");
    sb.writeln(getNullAsserts(allFields));
    sb.writeln(getToString(allFields, classNameTrim));
    sb.writeln(getHashCode(allFields));
    sb.writeln(getEquals(allFields, classNameTrim));
  }

  sb.writeln("}");

  return sb.toString();
}
