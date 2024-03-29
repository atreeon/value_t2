import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex14_inheritance_test.valuet2.dart';

//TOSTRING

@valueT2
abstract class $A {
  String get a;
}

@valueT2
abstract class $B implements $A {
  int get b;
}

@valueT2
abstract class $C implements $B {
  bool get c;
}

main() {
  test("1", () {
    var a = A(a: "A");
    var b = B(a: "A", b: 1);
    var c = C(a: "A", b: 1, c: true);

    expect(a.toString(), "(A-a:A)");
    expect(b.toString(), "(B-a:A|b:1)");
    expect(c.toString(), "(C-a:A|b:1|c:true)");
  });
}
