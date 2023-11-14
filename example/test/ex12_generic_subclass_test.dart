import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex12_generic_subclass_test.valuet2.dart';

//GENERIC SPECIFIED OF IMPLEMENTED CLASS, WITH ANOTHER GENERIC

@valueT2
abstract class $$A<Ta, Tb> {
  Ta get x;
  Tb get y;
}

@valueT2
abstract class $B<Ta, Tb> implements $$A<Ta, Tb> {
  String get z;
}

main() {
  test("1", () {
    var b = B(x: 1, y: 2, z: "a string");

    expect(b.x, 1);
    expect(b.y, 2);
    expect(b.z, "a string");
  });
}
