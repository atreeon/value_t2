import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex7_test.valuet2.dart';

//CLASS B OVERRIDES A PROPERTY OF CLASS A

@valueT2
abstract class $A {
  Person get a;
}

@valueT2
abstract class $B implements $A {
  Employee get a;
}

@valueT2
abstract class $C implements $B {
  Manager get a;
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
