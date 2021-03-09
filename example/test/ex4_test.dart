import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex4_test.valuet2.dart';

//ONLY USE IMPLEMENTS, EXTENDS IS NOT ALLOWED

@valueT2
abstract class $$Z {
  String get zValue;
}

@valueT2
abstract class $A implements $$Z {
  String get aValue;
}

@valueT2
abstract class $B implements $A {
  String get bValue;
}

@valueT2
abstract class $C implements $B {
  String get cValue;
}

main() {
  test("1", () {
    var a = A(aValue: "A", zValue: "Z");
    expect(a.aValue, "A");
    expect(a.zValue, "Z");

    var b = B(aValue: "A", bValue: "B", zValue: "Z");
    expect(b.aValue, "A");
    expect(b.bValue, "B");
    expect(a.zValue, "Z");

    var c = C(aValue: "A", bValue: "B", cValue: "C", zValue: "Z");
    expect(c.aValue, "A");
    expect(c.bValue, "B");
    expect(c.cValue, "C");
    expect(a.zValue, "Z");
  });
}
