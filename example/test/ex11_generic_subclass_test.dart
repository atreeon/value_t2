import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex11_generic_subclass_test.valuet2.dart';

//GENERIC SPECIFIED OF IMPLEMENTED CLASS

@valueT2
abstract class $$A<T1, T2> {
  T1 get x;
  T2 get y;

  const $$A();
}

@valueT2
abstract class $B implements $$A<int, String> {
  String get z;

  const $B();
}

main() {
  test("1", () {
    var a = B(x: 4, y: "string", z: "str");

    expect(a.x, 4);
    expect(a.y, "string");
    expect(a.z, "str");
  });

  test("1 ba copy with", () {
    var b = B(x: 1, y: "y", z: "z");
    var ba_copy = b.cwA(x: Opt(2), y: Opt("Y"));
    expect(ba_copy.toString(), "(B-x:2|y:Y|z:z)");
  });

  test("2 bb copy with", () {
    var b = B(x: 1, y: "y", z: "z");
    var bb_copy = b.cwB(x: Opt(2), y: Opt("Y"), z: Opt("Z"));
    expect(bb_copy.toString(), "(B-x:2|y:Y|z:Z)");
  });
}
