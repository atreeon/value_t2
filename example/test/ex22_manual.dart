import 'package:meta/meta.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

//COPY WITH
//COPY FROM

//tis difficult...not yet!

//@ValueT2()
//abstract class $A {
//  String get a;
//}
//
//@ValueT2()
//abstract class $B implements $A, $IsX {
//  int get b;
//}
//
//@ValueT2()
//abstract class $C implements $B, $IsY {
//  bool get c;
//}
//
//@ValueT2()
//abstract class $IsY {
//  bool get y;
//}
//
//@ValueT2()
//abstract class $IsX implements $IsY {
//  bool get x;
//}
//
//extension AExt_CopyToE on A {
//  B toB({@required int b}) => B(a: this.a, b: b);
//  C toC({@required int b, @required bool c}) => C(a: this.a, b: b, c: c);
//
//}
//
//extension BExt_CopyToE on B {
//  A toA() => A(a: this.a);
//  C toC({@required bool c}) => C(a: this.a, b: this.b, c: c);
//}
//
//extension CExt_CopyToE on B {
//  A toA() => A(a: this.a);
//  B toB() => B(a: this.a, b: this.b);
//}
//
//main() {
//  test("1", () {
//    var a = A(a: "A");
//    var b = B(a: "A", b: 1);
//    var c = C(a: "A", b: 1, c: true);
//
//    var a_aTob = a.toB(b: 1);
//    var a_aToc = a.toC(b: 1, c: true);
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
//}
//
//class A extends $A {
//  final String a;
//  A({
//    @required this.a,
//  }) : assert(a != null);
//  String toString() => "a:$a";
//}
//
//class B extends $B implements A {
//  final String a;
//  final int b;
//  B({
//    @required this.a,
//    @required this.b,
//  })  : assert(a != null),
//        assert(b != null);
//  String toString() => "a:$a|b:$b";
//}
//
//class C extends $C implements B {
//  final String a;
//  final int b;
//  final bool c;
//  C({
//    @required this.a,
//    @required this.b,
//    @required this.c,
//  })  : assert(a != null),
//        assert(b != null),
//        assert(c != null);
//  String toString() => "a:$a|b:$b|c:$c";
//}
