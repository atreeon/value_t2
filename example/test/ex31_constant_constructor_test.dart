import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex31_constant_constructor_test.valuet2.dart';

///To create a constant constructor, create the definition in our class definition.
///That then creates an alternative constructor that is a constant named .constant

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
