import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

//SELF REFERENCING CLASS
part 'ex32_test.valuet2.dart';

@valueT2
abstract class $A {
  $A? get a;
  int get b;
  const $A();
}

main() {
  test("1", () {
    var a = A.constant(
      b: 1,
      a: A.constant(
        b: 2,
        a: null,
      ),
    );

    expect(a.b, 1);
    expect(a.a!.b, 2);
  });
}
