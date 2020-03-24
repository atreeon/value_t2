import 'package:meta/meta.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';
import 'package:test/test.dart';

part 'ex13_test.g.dart';

//COPY WITH
//COPY FROM

@ValueT2()
abstract class $A {
  String get a;
}

@ValueT2()
abstract class $B implements $A {
  int get b;
}

@ValueT2()
abstract class $C implements $B {
  bool get c;
}

main() {
  test("1", () {
    var a = A(a: "A");
    var b = B(a: "A", b: 1);
    var c = C(a: "A", b: 1, c: true);

    var a1 = a.cwA(a: "Aa1");
    expect(a1.a, "Aa1");

    var b1 = b.cwA(a: "Ab1");
    expect(b1.a, "Ab1");
    expect((b1 as B).b, 1);

    var b2 = b.cwB(a: "Ab2", b: 2);
    expect(b2.a, "Ab2");
    expect(b2.b, 2);

    var c1 = c.cwA(a: "Ac1");
    expect(c1.a, "Ac1");
    expect((c1 as C).b, 1);
    expect((c1 as C).c, true);

    var c2 = c.cwB(a: "Ac1", b: 3);
    expect(c2.a, "Ac1");
    expect(c2.b, 3);
    expect((c2 as C).c, true);

    var c3 = c.cwC(a: "Ac1", b: 3, c: false);
    expect(c3.a, "Ac1");
    expect(c3.b, 3);
    expect(c3.c, false);
  });
//
//  test("2", () {
//    var a = A(a: "A");
//    var b = B(a: "A", b: 1);
//    var c = C(a: "A", b: 1, c: true);
//
//    var a_aTob = a.ctB(b: 1);
//    var a_aToc = a.ctC(b: 1, c: true);
//
//    var b_bToa = b.ctA();
//    var b_bToc = b.ctC(c: true);
//
//    var c_cToa = c.ctA();
//    var c_cTob = c.ctB();
//
//    expect(a_aTob.toString(), "Aa1");
//    expect(a_aToc.toString(), "Aa1");
//
//    expect(b_bToa.toString(), "Aa1");
//    expect(b_bToc.toString(), "Aa1");
//
//    expect(c_cToa.toString(), "Aa1");
//    expect(c_cTob.toString(), "Aa1");
//  });
}
