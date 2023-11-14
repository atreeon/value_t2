import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

// COPYTO FROM SUB CLASS TO A SIBLING SUB CLASS

part 'ex37_test.valuet2.dart';

@ValueT2()
abstract class $$Super {
  String get x;
}

@ValueT2([$SubB])
abstract class $SubA implements $$Super {
  // String get x;
}

@ValueT2()
abstract class $SubB implements $$Super {
  // String get x;
  String get z;
}

main() {
  test("subA to subB (sub sibling to sub)", () {
    SubA subA = SubA(x: "x");
    SubB subB = subA.copyToSubB(z: "z");

    expect(subB.toString(), "(SubB-z:z|x:x)");
  });
}
