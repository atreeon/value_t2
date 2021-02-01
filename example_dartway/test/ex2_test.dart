//GENERIC INTERFACES AND GENERICS ARE HANDLED AUTOMATICALLY

import 'package:test/test.dart';

abstract class A<T> {
  T get x;
}

class B<T extends C, T3> implements A<int>, C {
  final T y;
  final T3 p;
  final String z;
  final int x;

  B({
    required this.y,
    required this.p,
    required this.z,
    required this.x,
  });
}

class C {
  final String z;
  C({required this.z});
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
