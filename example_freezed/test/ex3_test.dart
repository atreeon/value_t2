//import 'package:freezed_annotation/freezed_annotation.dart';
//import 'package:test/test.dart';
//
//part 'ex3_test.freezed.dart';
//
////INTERFACES ARE AUTO IMPLEMENTED
////CANNOT DO IS X OR Y ETC
//
//@freezed
//abstract class Clases with _$Classes {
//  const factory Clases.A(String bBalue) = Data;
//  const factory Clases.B() = Loading;
//  const factory Clases.C([String message]) = ErrorDetails;
//}
//
//@ValueT2()
//abstract class $B implements $A {
//  String get bValue;
//}
//
//@ValueT2()
//abstract class $C implements $B {
//  String get cValue;
//}
//
//main() {
//  test("1", () {
//    var a = A(aValue: "A");
//    expect(a.aValue, "A");
//
//    var b = B(aValue: "A", bValue: "B");
//    expect(b.aValue, "A");
//    expect(b.bValue, "B");
//
//    var c = C(aValue: "A", bValue: "B", cValue: "C");
//    expect(c.aValue, "A");
//    expect(c.bValue, "B");
//    expect(c.cValue, "C");
//  });
//}
