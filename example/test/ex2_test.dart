import 'package:meta/meta.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';
import 'package:quiver_hashcode/hashcode.dart';

part 'ex2_test.g.dart';

//GENERIC INTERFACES AND GENERICS ARE HANDLED AUTOMATICALLY

@ValueT2()
abstract class $$A<T> {
  T get x;
}

@ValueT2()
abstract class $B<T extends $C, T3> implements $$A<int>, $C {
  T get y;
  T3 get p;
}

@ValueT2()
abstract class $C {
  String get z;
}

main() {
  test("1", () {
    var b = B<C, int>(x: 5, y: C(z: "Z"), z: "null", p: 7);

    expect(b.x, 5);
    expect(b.y.z, "Z");
    expect(b.z, "null");
    expect(b.p, 7);
  });
}
