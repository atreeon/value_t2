import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

// COPYTO FROM SUB CLASS TO A SIBLING SUB CLASS

part 'ex37_changeTo_siblings_test.valuet2.dart';

/// We can also copy to a sibling class.
/// todo: y property on SubA class not properly working. This doesn't quite work yet.
/// Any properties not in the newly created sibling class, the values are lost.

@ValueT2()
abstract class $$Super {
  String get x;
}

@ValueT2(explicitSubTypes: [$SubB])
abstract class $SubA implements $$Super {
  // String get y; //todo: this currently doesn't work
}

@ValueT2()
abstract class $SubB implements $$Super {
  // String get x;
  String get z;
}

main() {
  test("subA to subB (sub sibling to sub)", () {
    SubA subA = SubA(x: "x");
    SubB subB = subA.changeTo_SubB(z: "z");

    expect(subB.toString(), "(SubB-z:z|x:x)");
  });
}
