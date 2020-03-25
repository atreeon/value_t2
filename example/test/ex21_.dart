import 'package:meta/meta.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex21_.g.dart';

//PRIVATE CONSTRUCTOR FOR DEFAULT VALUES USES UNDERSCORE AT END OF CLASS

@ValueT2()
abstract class $A_ {
  String a;
}

A_ AFactory() {
  return A_._(a: "blah");
}
