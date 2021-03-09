import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex11_test.valuet2.dart';

//GENERIC SPECIFIED OF IMPLEMENTED CLASS

@valueT2
abstract class $$A<T1, T2> {
  T1 get x;
  T2 get y;
}

@valueT2
abstract class $B implements $$A<int, String> {
  String get z;
}

main() {
  test("1", () {
    var a = B(x: 4, y: "string", z: "str");

    expect(a.x, 4);
    expect(a.y, "string");
    expect(a.z, "str");
  });
}
