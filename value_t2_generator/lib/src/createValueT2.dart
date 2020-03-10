import 'package:value_t2_generator/src/classes.dart';
import 'package:value_t2_generator/src/helpers.dart';

String createValueT2(
  bool isAbstract,
  List<NameTypeClass> allFields,
  String className,
  List<Interface> interfaces,
  List<NameType> classGenerics,
) {
  var classNameTrim = className.replaceAll("\$", "");
  var allFieldsDistinct = getDistinctFields(allFields, interfaces, classNameTrim);
//  var allFieldsDistinct = allFields.map((e) => NameType(e.name, e.type)).toList();

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
    sb.writeln(getPropertiesAbstract(allFieldsDistinct));
  } else {
    sb.writeln(getProperties(allFieldsDistinct));
    sb.writeln("${classNameTrim}({");
    sb.writeln(getConstructorRows(allFieldsDistinct));
    sb.writeln("}):");
    sb.writeln(getNullAsserts(allFieldsDistinct));
  }

  sb.writeln("}");

  return sb.toString();
}
