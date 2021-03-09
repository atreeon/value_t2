import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex2_test.valuet2.dart';

//GENERIC INTERFACES AND GENERICS ARE HANDLED AUTOMATICALLY

@valueT2
abstract class $$A<T> {
  T get x;
}

@valueT2
abstract class $B<T extends $C, T3> implements $$A<int>, $C {
  ///Blah
  T get y;
}

@valueT2
abstract class $C {
  String get z;
}

main() {
  test("1", () {
    var b = B<C, int>(x: 5, y: C(z: "Z"), z: "null");

    expect(b.x, 5);
    expect(b.y.z, "Z");
    expect(b.z, "null");
  });
}
