import 'package:test/test.dart';
import 'package:value_t2_generator/src/classes.dart';
import 'package:value_t2_generator/src/createValueT2.dart';

void main() {
  group("createValueT2", () {
    test("1a", () {
      var result = createValueT2(
        true,
        [NameType("type", "String")],
        "\$PetBase",
        [],
        [],
      );

      var expected = """abstract class PetBase extends \$PetBase {
String get type;
}""";

      expect(result.trim(), expected.trim());
    });

    test("1b", () {
      var result = createValueT2(
        false,
        [NameType("type", "String")],
        "\$Pet",
        [],
        [],
      );

      var expected = """class Pet extends \$Pet {
final String type;
Pet({
@required this.type,
}):
assert(type != null);
}""";

      expect(result.trim(), expected.trim());
    });

    test("1c", () {
      var result = createValueT2(
        false,
        [
          NameType("type", "String"),
          NameType("age", "int"),
        ],
        "\$Pet",
        [],
        [],
      );

      var expected = """class Pet extends \$Pet {
final String type;
final int age;
Pet({
@required this.type,
@required this.age,
}):
assert(type != null),
assert(age != null);
}""";

      expect(result.trim(), expected.trim());
    });

    test("2a", () {
      var result = createValueT2(
        true,
        [NameType("x", "T")],
        "\$A",
        [],
        [NameType("T", null)],
      );

      var expected = """abstract class A<T> extends \$A<T> {
T get x;
}""";

      expect(result.trim(), expected.trim());
    });

    test("2b", () {
      var result = createValueT2(
        false,
        [
          NameType("x", "T"),
          NameType("p", "T3"),
          NameType("y", "T"),
          NameType("z", "String"),
        ],
        "\$B",
        [
          Interface("\$A", ["int"], ["T"]),
          Interface("\$C", [], [])
        ],
        [
          NameType("T", "\$C"),
          NameType("T3", null),
        ],
      );

      var expected = """class B<T extends C, T3> extends \$B<T, T3> implements A<int>, C {
final T x;
final T3 p;
final T y;
final String z;
B({
@required this.x,
@required this.p,
@required this.y,
@required this.z,
}):
assert(x != null),
assert(p != null),
assert(y != null),
assert(z != null);
}""";

      expect(result.trim(), expected.trim());
    });
  });
}
