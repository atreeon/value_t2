import 'package:meta/meta.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex21_test.g.dart';

//PRIVATE CONSTRUCTOR FOR DEFAULT VALUES USES UNDERSCORE AT END OF CLASS

@ValueT2()
abstract class $A_ {
  String a;
}

void main() {
  test("1 default value", () {
    var a = AFactory();
    expect(a.a, "my default value");
  });
}

A_ AFactory() {
  return A_._(a: "my default value");
}
