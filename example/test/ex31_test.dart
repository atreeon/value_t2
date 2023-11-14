import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

//CONSTANT CONSTRUCTOR FOR STATIC CONST VARIABLES
part 'ex31_test.valuet2.dart';

@valueT2
abstract class $A {
  int get a;
  const $A();
}

class MyStaticClass {
  static const concepts2 = <A>[
    A.constant(a: 5),
  ];
}

main() {
  test("1", () {
    var a = A.constant(a: 1);

    expect(a.a, 1);
  });
}
