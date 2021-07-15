import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

//CLASS B OVERRIDES A PROPERTY OF CLASS A
part 'ex30_test.valuet2.dart';

class Person {
  final String name;
  Person(this.name);
}

class Employee implements Person {
  final String name;
  final String id;
  Employee(this.name, this.id);
}

@valueT2
abstract class $A {
  Person get a;
}

@valueT2
abstract class $B implements $A {
  Employee get a;
}

main() {
  test("1", () {
    var a = A(a: Person("bob"));
    var b = B(a: Employee("bob", "123"));

    expect(a.a.name, "bob");
    expect(b.a.name, "bob");
    expect(b.a.id, "123");
  });
}
