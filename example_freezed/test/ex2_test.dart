import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

part 'ex2_test.freezed.dart';

//GENERIC INTERFACES AND GENERICS ARE HANDLED AUTOMATICALLY
//I MAY NOT BE ABLE TO DO THIS BUT IT IS HORRIBLE ANYWAY!

//@freezed
//abstract class A<T> with _$A {
//  const factory A(T x) = _A;
//}
//
////@ValueT2()
////abstract class $$A<T> {
////  T get x;
////}
//
//@freezed
//abstract class B<T extends C, T3> with _$B {
//  const factory B() = _B;
//}
//
//@ValueT2()
//abstract class $B<T extends $C, T3> implements $$A<int>, $C {
//  ///Blah
//  T get y;
//  T3 get p;
//}
//
//@ValueT2()
//abstract class $C {
//  String get z;
//}
//
//main() {
//  test("1", () {
//    var b = B<C, int>(x: 5, y: C(z: "Z"), z: "null", p: 7);
//
//    expect(b.x, 5);
//    expect(b.y.z, "Z");
//    expect(b.z, "null");
//    expect(b.p, 7);
//  });
//}
