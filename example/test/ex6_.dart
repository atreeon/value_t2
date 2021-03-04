//import 'package:test/test.dart';
//import 'package:value_t2_annotation/value_t2_annotation.dart';
//import 'package:meta/meta.dart';
//
//part 'ex6_test.valuet2.dart';
//
////CURRENTLY NOT ALLOWING CUSTOM GETTERS (CAN JUST USE A FUNCTION)
////  this is where mixins would have been a better approach
//
//@ValueT2()
//abstract class $A {
//  String get z;
//
//  const $A();
//}
//
//@ValueT2()
//abstract class $B {
//  String get y;
//  String get z => y;
//
//  const $B();
//}
//
//main() {
//  test("1", () {
//    var a = $B(type: "cat");
//
//    expect(a.type, "cat");
//  });
//}
