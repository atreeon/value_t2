import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:dartx/dartx.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';
import 'package:value_t2_generator/src/classes.dart';
import 'package:value_t2_generator/src/createValueT2.dart';

import 'GeneratorForAnnotationX.dart';

List<NameType> getAllFields(List<InterfaceType> interfaceTypes, ClassElement element) {
  var superTypeFields = interfaceTypes //
      .where((x) => x.element.name != "Object")
      .flatMap((st) => st.element.fields.map((f) => //
          NameType(f.name, f.type.toString())))
      .toList();
  var classFields = element.fields.map((f) => //
      NameType(f.name, f.type.toString())).toList();

  return (classFields + superTypeFields).distinctBy((x) => x.name).toList();
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

    sb.writeln("//RULES: ");

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
            Interface(e.element.name, e.typeArguments.map((e) => e.toString()).toList())) //
        .toList();
    var classGenerics = ce.typeParameters
        .map((e) => NameType(e.name, e.bound == null ? null : e.bound.toString())) //
        .toList();

    if (isAbstract && allFields.isEmpty) {
      throw Exception("you must use implements, not extends");
    }

    sb.writeln("//af:${allFields.toString()}");
    sb.writeln("//cn:$className");
    sb.writeln("//i:${interfaces.toString()}");
    sb.writeln("//cg:${classGenerics}");

    sb.writeln(createValueT2(
      isAbstract,
      allFields,
      className,
      interfaces,
      classGenerics,
    ));

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
