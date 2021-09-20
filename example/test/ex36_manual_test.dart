import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

// COPY WITH FROM SUB CLASS TO SUPER CLASS
// AND
// FROM SUPERCLASS TO SUB CLASS

part 'ex36_manual_test.valuet2.dart';

@valueT2
abstract class $A {
  String get x;
}

@valueT2
abstract class $B implements $A {
  String get x;
  String get y;
  $C get z;
}

@valueT2
abstract class $C {
  String get v;
}

extension A_E on A {
  B copyToB({
    Opt<String>? x,
    required String y,
    required $C z,
  }) {
    return B(
      x: x == null ? this.x as String : x.value as String,
      y: y,
      z: z as C,
    );
  }
}

main() {
  test("a to b (super to sub)", () {
    A a = A(x: "x");
    B b = a.copyToB(y: "y", z: C(v: "v"));

    expect(b.toString(), "(B-x:x|y:y|z:(C-v:v))");
  });
}
