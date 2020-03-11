//import 'package:meta/meta.dart';
//import 'package:test/test.dart';
//import 'package:value_t2_annotation/value_t2_annotation.dart';
//
//part 'ex8_test.g.dart';
//
////THE SIMPLEST OF EXAMPLES
//
//@ValueT2()
//abstract class $A {
//  int get a;
//}
//
//@ValueT2()
//abstract class $B {
//  int get b;
//}
//
//@ValueT2()
//abstract class $C {
//  int get c;
//}
//
//main() {
//  test("1", () {
//    var a = A(a: 1);
//    var b = B(a: 1, b: 2);
//    var c = C(a: 1, b: 2, c: 3);
//
//    expect(a.a, 1);
//    expect(b.a, 1);
//    expect(b.b, 2);
//    expect(c.a, 1);
//    expect(c.b, 2);
//    expect(c.c, 3);
//  });
//}
