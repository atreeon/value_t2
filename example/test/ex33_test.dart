import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex33_test.valuet2.dart';

//EQUALITY WITH LISTS

@valueT2
abstract class $A {
  String get a;
}

@valueT2
abstract class $B {
  List<int> get b;
}

@valueT2
abstract class $C {
  List<$A> get c;
}

main() {
  test("1", () {
    var a1 = A(a: "1");
    var a2 = A(a: "2");
    var a3 = A(a: "3");
    var a4 = A(a: "4");

    var b1 = B(b: [1, 2, 3]);
    var b2 = B(b: [1, 2, 3, 4]);
    var b3 = B(b: [1, 3, 2]);
    var b4 = B(b: [1, 2, 3]);

    expect(b1 == b2, false);
    expect(b1 == b3, true);
    expect(b2 == b3, false);
    expect(b1 == b4, true);

    var c1 = C(c: [a1, a2, a3]);
    var c2 = C(c: [a1, a2, a3, a4]);
    var c3 = C(c: [a1, a3, a2]);
    var c4 = C(c: [a1, a2, a3]);

    expect(c1 == c2, false);
    expect(c1 == c3, true);
    expect(c2 == c3, false);
    expect(c1 == c4, true);
  });
}
