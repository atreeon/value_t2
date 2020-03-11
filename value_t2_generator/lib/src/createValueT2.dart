import 'package:value_t2_generator/src/classes.dart';
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
  if (classGenerics.isNotEmpty) //
    sb.write(getClassGenerics(classGenerics));
  sb.write(" extends ${className}");
  if (classGenerics.isNotEmpty) //
    sb.write(getExtendsGenerics(classGenerics));
  if (interfaces.isNotEmpty) //
    sb.write(getImplements(interfaces));
  sb.writeln(" {");

  if (isAbstract) {
    sb.writeln(getPropertiesAbstract(allFields));
  } else {
    var classNameTrim = className.replaceAll("\$", "");
    sb.writeln(getProperties(allFields));
    sb.writeln("${classNameTrim}({");
    sb.writeln(getConstructorRows(allFields));
    sb.writeln("}):");
    sb.writeln(getNullAsserts(allFields));
  }

  sb.writeln("}");

  return sb.toString();
}
