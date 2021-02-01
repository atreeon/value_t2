import 'package:test/test.dart';

//INTERFACES ARE AUTO IMPLEMENTED

class A {
  final String aValue;

  A({required this.aValue});
}

class B implements A {
  final String aValue;
  final String bValue;

  B({required this.aValue, required this.bValue});
}

class C implements B {
  final String aValue;
  final String bValue;
  final String cValue;

  C({required this.aValue, required this.bValue, required this.cValue});
}

main() {
  test("1", () {
    var a = A(aValue: "A");
    expect(a.aValue, "A");

    var b = B(aValue: "A", bValue: "B");
    expect(b.aValue, "A");
    expect(b.bValue, "B");

    var c = C(aValue: "A", bValue: "B", cValue: "C");
    expect(c.aValue, "A");
    expect(c.bValue, "B");
    expect(c.cValue, "C");
  });
}
