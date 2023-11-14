import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex3_inheritance_test.valuet2.dart';

//INTERFACES ARE AUTO IMPLEMENTED

@valueT2
abstract class $A {
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
    var a = A(aValue: "A");
    expect(a.aValue, "A");

    var b = B(aValue: "A", bValue: "B");
    expect(b.aValue, "A");
    expect(b.bValue, "B");

    var c = C(aValue: "A", bValue: "B", cValue: "C");
    expect(c.aValue, "A");
    expect(c.bValue, "B");
    expect(c.cValue, "C");
  });
}
