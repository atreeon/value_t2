import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

// COPY TO - FROM SUPERCLASS TO SUB CLASS

part 'ex36_test.valuet2.dart';

@ValueT2([$B])
abstract class $A {
  String get x;
}

@ValueT2()
abstract class $B implements $A {
  String get x;
  String get y;
}

main() {
  test("a to b (super to sub)", () {
    A a = A(x: "x");
    B b = a.copyToB(y: "y");

    expect(b.toString(), "(B-x:x|y:y)");
  });
}
