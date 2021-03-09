import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer_models/analyzer_models.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:copy_with_e_generator/src/createCopyWith.dart';
import 'package:dartx/dartx.dart';
import 'package:generator_common/GeneratorForAnnotationX.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';
import 'package:value_t2_generator/src/classes.dart';
import 'package:value_t2_generator/src/createValueT2.dart';
import 'package:value_t2_generator/src/helpers.dart';

List<NameTypeClassWithComment> getAllFields(List<InterfaceType> interfaceTypes, ClassElement element) {
  var superTypeFields = interfaceTypes //
      .where((x) => x.element.name != "Object")
      .flatMap((st) => st.element.fields.map((f) => //
          NameTypeClassWithComment(f.name, f.type.toString(), st.element.name, comment: f.getter.documentationComment)))
      .toList();
  var classFields = element.fields.map((f) => //
      NameTypeClassWithComment(f.name, f.type.toString(), element.name, comment: f.getter.documentationComment)).toList();

  //distinct, will keep classFields over superTypeFields
  return (classFields + superTypeFields).distinctBy((x) => x.name).toList();
}

class ValueT2Generator<TValueT extends ValueTX> extends GeneratorForAnnotationX<TValueT> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
    List<ClassElement> allClasses,
  ) {
    var sb = StringBuffer();

//    var nullFieldNames = <String>[];
//    if (!annotation.read('nullFieldNames').isNull) {
//      nullFieldNames = annotation
//          .read('nullFieldNames') //
//          .listValue
//          .map((e) => e.toStringValue())
//          .toList();
//    }

//    sb.writeln("//RULES: you must use implements, not extends");

    if (element is! ClassElement) {
      throw Exception("not a class");
    }

    ClassElement ce = element;

    if (ce.supertype.element.name != "Object") {
      throw Exception("you must use implements, not extends");
    }

    var docComment = ce.documentationComment;

    var isAbstract = ce.name.startsWith("\$\$");
    var allFields = getAllFields(ce.allSupertypes, ce).where((x) => x.name != "hashCode").toList();
    var className = ce.name;
    var interfaces = ce.interfaces
        .map((e) => //
            InterfaceWithComment(
              e.element.name,
              e.typeArguments.map((e) => e.toString()).toList(),
              e.element.typeParameters.map((x) => x.name).toList(),
              comment: e.element.documentationComment,
            )) //
        .toList();
    var classGenerics = ce.typeParameters
        .map((e) => NameTypeWithComment(e.name, e.bound == null ? null : e.bound.toString())) //
        .toList();

    var allFieldsDistinct = getDistinctFields(allFields, interfaces);

    var otherClasses = allClasses //
        .where((x) => x.allSupertypes.any((st) => st.element.name.replaceAll("\$", "") == element.name.replaceAll("\$", "")))
        .map((x) {
      var interfaces = x.interfaces
          .map((e) => //
              InterfaceWithComment(
                e.element.name,
                e.typeArguments.map((e) => e.toString()).toList(),
                e.element.typeParameters.map((x) => x.name).toList(),
                comment: e.element.documentationComment,
              )) //
          .toList();
      var distinctFields = getDistinctFields(getAllFields(x.allSupertypes, x), interfaces);

      return ClassDef(
        x.name.startsWith("\$\$"),
        x.name.replaceAll("\$", ""),
        distinctFields,
//        x.typeParameters.isEmpty ? [] : x.typeParameters.where((x) => x.name != null).toList(),
        x.typeParameters.isEmpty ? [] : x.typeParameters.where((x) => x.name != null).map((x) => //
            GenericType(x.name, x.bound == null ? null : x.bound.toString())).toList(),
        [
          ...x.interfaces
              .where((e) => e.element.name != "Object") //
              .map((e) => e.element.name.replaceAll("\$", "")),
          x.supertype.element.name
        ],
      );
    }).toList();

//    var interfaces2 = ce.interfaces
//        .map((e) => //
//    e.element.typeParameters.map((x) => x.name + "|" + x.runtimeType.toString())) //
//        .toList();
//    sb.writeln("//allClasses:${allClasses.map((e) => e.name)}");

//    sb.writeln("//allClasses:${allClasses.map((e) => e.name)}");
//    sb.writeln("//other:${otherClasses.map((e) => e.name)}");
//    sb.writeln("//af:${allFields.toString()}");
//    sb.writeln("//cn:$className");
//    sb.writeln("//i:${interfaces.toString()}");
//    sb.writeln("//i2:${interfaces2.toString()}");
//    sb.writeln("//cg:${classGenerics}");
//
//    sb.writeln("//afd:${allFieldsDistinct.toString()}");

//    if (allFields.count() > 0) //
//      sb.writeln("//af:${allFields[0].comment}");
//
//    if (allFields.count() > 1) //
//      sb.writeln("//af:${allFields[1].comment}");
//
//    if (allFieldsDistinct.count() > 0) //
//      sb.writeln("//af:${allFieldsDistinct[0].comment}");
//
//    if (allFieldsDistinct.count() > 1) //
//      sb.writeln("//af:${allFieldsDistinct[1].comment}");

    sb.writeln(createValueT2(
      isAbstract,
      allFieldsDistinct,
      className,
      docComment,
      interfaces,
      classGenerics,
    ));

    var classDef = ClassDef(
      isAbstract,
      ce.name.replaceAll("\$", ""),
      allFieldsDistinct,
      ce.typeParameters.isEmpty ? [] : ce.typeParameters.where((x) => x.name != null).map((x) => //
          GenericType(x.name, x.bound == null ? null : x.bound.toString())).toList(),
      [...ce.interfaces.map((e) => e.element.name), ce.supertype.element.name],
    );

//    sb.writeln(createCopyWith(classDef, otherClasses));
    sb.writeln(createCopyWith(classDef, otherClasses).replaceAll("\$", ""));

    var output = sb.toString();
    //use to comment output
    //output = output.replaceAll("\n", "\n//");

    return output;
  }
}
