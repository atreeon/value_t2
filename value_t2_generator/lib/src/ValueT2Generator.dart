import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:copy_with_e_generator/src/classes.dart' as cwClasses;
import 'package:dartx/dartx.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';
import 'package:value_t2_generator/src/classes.dart';
import 'package:value_t2_generator/src/createValueT2.dart';

import 'GeneratorForAnnotationX.dart';

List<NameTypeClass> getAllFields(List<InterfaceType> interfaceTypes, ClassElement element) {
  var superTypeFields = interfaceTypes //
      .where((x) => x.element.name != "Object")
      .flatMap((st) => st.element.fields.map((f) => //
          NameTypeClass(f.name, f.type.toString(), st.element.name)))
      .toList();
  var classFields = element.fields.map((f) => //
      NameTypeClass(f.name, f.type.toString(), element.name)).toList();

  //distinct, will keep classFields over superTypeFields
  return (classFields + superTypeFields).distinctBy((x) => x.name).toList();

//  return (classFields + superTypeFields);
}

class ValueT2Generator extends GeneratorForAnnotationX<ValueT2> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
    List<ClassElement> allClasses,
  ) {
    var sb = StringBuffer();

    sb.writeln("//RULES: you must use implements, not extends");

    if (element is! ClassElement) {
      throw Exception("not a class");
    }

    ClassElement ce = element;

    if (ce.supertype.element.name != "Object") {
      throw Exception("you must use implements, not extends");
    }

    var isAbstract = annotation
        .read('isAbstract') //
        .boolValue;

    var allFields = getAllFields(ce.allSupertypes, ce);
    var className = ce.name;
    var interfaces = ce.interfaces
        .map((e) => //
            Interface(
              e.element.name,
              e.typeArguments.map((e) => e.toString()).toList(),
              e.element.typeParameters.map((x) => x.name).toList(),
            )) //
        .toList();
    var interfaces2 = ce.interfaces
        .map((e) => //
            e.element.typeParameters.map((x) => x.name + "|" + x.runtimeType.toString())) //
        .toList();
    var classGenerics = ce.typeParameters
        .map((e) => NameType(e.name, e.bound == null ? null : e.bound.toString())) //
        .toList();

//    if (!isAbstract && allFields.isEmpty) {
//      throw Exception("if is abstract you must have ");
//    }

    var otherClasses = allClasses //
        .where((x) => x.allSupertypes.any((st) => st.element.name == element.name))
        .map((x) => cwClasses.ClassDef(
              x.isAbstract,
              x.name,
              allFields.map((e) => cwClasses.NameType(e.name, e.type)).toList(),
              [],
            ))
        .toList();

    sb.writeln("//other:${otherClasses.map((e) => e.name)}");
    sb.writeln("//af:${allFields.toString()}");
    sb.writeln("//cn:$className");
    sb.writeln("//i:${interfaces.toString()}");
    sb.writeln("//i2:${interfaces2.toString()}");
    sb.writeln("//cg:${classGenerics}");

    sb.writeln(createValueT2(
      isAbstract,
      allFields,
      className,
      interfaces,
      classGenerics,
    ));

    var classDef = cwClasses.ClassDef(
      isAbstract,
      element.name.replaceAll("\$", ""),
      allFields.map((e) => cwClasses.NameType(e.name, e.type)).toList(),
      [],
    );

    sb.writeln(createCopyWith(classDef, otherClasses));

    return element.session.getResolvedLibraryByElement(element.library).then((resolvedLibrary) {
      return sb.toString();
    });
  }
}

//var allSupertypes = ce.allSupertypes.map((x) => x.element.name);

//    var interfaces = ce.interfaces.map((e) => e.element.name);
//    var exceptInterfaces = allSupertypes.except(interfaces);

//sb.writeln("//sts:${allSupertypes.toString()}");
//sb.writeln("//st:${ce.supertype.element.name}");
//sb.writeln("//i:${interfaces.toString()}");
//sb.writeln("//ei:${exceptInterfaces.toString()}");
//sb.writeln("//n:${ce.name}");
