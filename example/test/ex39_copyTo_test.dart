import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

// COPY TO - FROM ABSTRACT SUPERCLASS TO SUB CLASS

part 'ex39_copyTo_test.valuet2.dart';

@ValueT2([$B])
abstract class $$Super {
  String get x;
}

@ValueT2()
abstract class $A implements $$Super {
  String get x;
  String get z;
}

@ValueT2()
abstract class $B implements $$Super {
  String get x;
  String get y;
}

main() {
  test("super (underlying a) to b (abstract super to sub)", () {
    Super _super = A(x: "x", z: "z");
    var b = _super.changeTo_B(y: "y");

    //super class is copied and a B class is created.
    expect(b.toString(), "(B-x:x|y:y)");
  });
}
