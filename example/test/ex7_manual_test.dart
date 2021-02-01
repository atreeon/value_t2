import 'package:test/test.dart';

//CLASS B OVERRIDES A PROPERTY OF CLASS A

abstract class $A {
  Person get a;
}

class A extends $A {
  final Person a;
  A({
    required this.a,
  });
}

abstract class $B implements $A {
  Employee get a;
}

class B extends $B implements A {
  final Employee a;
  B({
    required this.a,
  });
}

abstract class $C implements $B {
  Manager get a;
}

class C extends $C implements B {
  final Manager a;
  C({
    required this.a,
  });
}

main() {
  test("1", () {
    var a = A(a: Person("bob"));
    var b = B(a: Employee("bob", "123"));
    var c = C(a: Manager("bob", "123", "Big boss"));

    expect(a.a.name, "bob");
    expect(b.a.name, "bob");
    expect(b.a.id, "123");
    expect(c.a.name, "bob");
    expect(c.a.id, "123");
    expect(c.a.managerType, "Big boss");
  });
}

class Person {
  final String name;
  Person(this.name);
}

class Employee implements Person {
  final String name;
  final String id;
  Employee(this.name, this.id);
}

class Manager implements Employee {
  final String name;
  final String id;
  final String managerType;
  Manager(this.name, this.id, this.managerType);
}
