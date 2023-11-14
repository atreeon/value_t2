import 'package:value_t2_annotation/value_t2_annotation.dart';
import 'package:test/test.dart';

// ignore_for_file: UNNECESSARY_CAST

abstract class A<T> {
  T get x;

  A cwA<T>({
    Opt<T>? x,
  });
}

class B<T extends $C, T3> implements A<int> {
  final int x;
  final T y;

  B({
    required this.x,
    required this.y,
  });

  String toString() => "(B-x:$x|y:$y)";

  B cwA<T>({
    Opt<T>? x,
  }) {
    return B(
      x: x == null ? this.x as int : x.value as int,
      y: (this as B).y,
    );
  }

  B cwB<T extends $C, T3>({
    Opt<int>? x,
    Opt<T>? y,
  }) {
    return B(
      x: x == null ? this.x as int : x.value as int,
      y: y == null ? this.y as T : y.value as T,
    );
  }
}

abstract class $C {
  String get z;
}

class C implements $C {
  final String z;
  C(this.z);
  String toString() => "(C-z:$z)";
}

main() {
  test("1 ba copy with", () {
    var b = B(x: 1, y: C("z"));
    var ba_copy = b.cwA(x: Opt(2));
    expect(ba_copy.toString(), "(B-x:2|y:(C-z:z))");
  });

  test("2 bb copy with", () {
    var b = B(x: 1, y: C("z"));
    var bb_copy = b.cwB(x: Opt(2), y: Opt(C("Z")));
    expect(bb_copy.toString(), "(B-x:2|y:(C-z:Z))");
  });
}
