import 'package:analyzer_models/analyzer_models.dart';
import 'package:test/test.dart';
import 'package:value_t2_generator/src/classes.dart';
import 'package:value_t2_generator/src/createValueT2.dart';

void main() {
  group("createValueT2", () {
    test("1a", () {
      var result = createValueT2(
        true,
        [NameTypeWithComment("type", "String", comment: "///a type")],
        "\$PetBase",
        null,
        [],
        [],
        [],
      );

      var expected = """abstract class PetBase extends \$PetBase {
///a type
String get type;
}""";

      expect(result.trim(), expected.trim());
    });

    test("1b", () {
      var result = createValueT2(
        false,
        [NameTypeWithComment("type", "String")],
        "\$Pet",
        null,
        [],
        [],
        [],
      );

      var expected = """class Pet extends \$Pet {
final String type;

Pet({
@required this.type,
}):
assert(type != null);
String toString() => "(Pet-type:\$type)";
int get hashCode => hashObjects([type.hashCode]);
bool operator ==(Object other) => identical(this, other) || other is Pet && runtimeType == other.runtimeType &&
type == other.type;
}""";

      expect(result.trim(), expected.trim());
    });

    test("1c", () {
      var result = createValueT2(
        false,
        [
          NameTypeWithComment("type", "String"),
          NameTypeWithComment("age", "int"),
        ],
        "\$Pet",
        null,
        [],
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
String toString() => "(Pet-type:\$type|age:\$age)";
int get hashCode => hashObjects([type.hashCode, age.hashCode]);
bool operator ==(Object other) => identical(this, other) || other is Pet && runtimeType == other.runtimeType &&
type == other.type && age == other.age;
}""";

      expect(result.trim(), expected.trim());
    });

    test("2a", () {
      var result = createValueT2(
        true,
        [NameTypeWithComment("x", "T")],
        "\$A",
        null,
        [],
        [NameTypeWithComment("T", null)],
        [],
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
          NameTypeWithComment("x", "T"),
          NameTypeWithComment("p", "T3"),
          NameTypeWithComment("y", "T"),
          NameTypeWithComment("z", "String"),
        ],
        "\$B",
        "///Blah",
        [
          InterfaceWithComment("\$A", ["int"], ["T"], comment: "///blah2"),
          Interface("\$C", [], [])
        ],
        [
          NameTypeWithComment("T", "\$C"),
          NameTypeWithComment("T3", null),
        ],
        [],
      );

      var expected = """
///Blah

///implements [\$A]
///blah2
class B<T extends \$C, T3> extends \$B<T, T3> implements A<int>, C {
final T x;
final T3 p;
final T y;
final String z;
///Blah

///implements [\$A]
///blah2
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
String toString() => "(B-x:\$x|p:\$p|y:\$y|z:\$z)";
int get hashCode => hashObjects([x.hashCode, p.hashCode, y.hashCode, z.hashCode]);
bool operator ==(Object other) => identical(this, other) || other is B && runtimeType == other.runtimeType &&
x == other.x && p == other.p && y == other.y && z == other.z;
}""";

      expect(result.trim(), expected.trim());
    });

    test("x", () {
      var result = createValueT2(
        false,
        [NameTypeWithComment("type", "String")],
        "\$Pet_",
        null,
        [],
        [],
        [],
      );

      var expected = """class Pet_ extends \$Pet_ {
final String type;

Pet_._({
@required this.type,
}):
assert(type != null);
String toString() => "(Pet_-type:\$type)";
int get hashCode => hashObjects([type.hashCode]);
bool operator ==(Object other) => identical(this, other) || other is Pet_ && runtimeType == other.runtimeType &&
type == other.type;
}""";

      expect(result.trim(), expected.trim());
    });
  });
}
