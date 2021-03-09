import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex12_test.valuet2.dart';

//GENERIC SPECIFIED OF IMPLEMENTED CLASS, WITH ANOTHER GENERIC

@valueT2
abstract class $$A<T1, T2> {
  T1 get x;
  T2 get y;
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
