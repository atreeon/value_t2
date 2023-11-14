////import 'package:analyzer_models/analyzer_models.dart';
//import 'package:generator_common/NameType.dart';
//import 'package:generator_common/classes.dart';
//import 'package:test/test.dart';
//import 'package:value_t2_generator/src/createValueT2.dart';
//
//void main() {
//  group("createValueT2", () {
//    test("1a", () {
//      var result = createValueT2(
//        true,
//        [NameTypeClassComment("type", "String", null, comment: "///a type")],
//        "\$PetBase",
//        null,
//        [],
//        [],
//      );
//
//      var expected = """abstract class PetBase extends \$PetBase {
/////a type
//String get type;
//}""";
//
//      expect(result.trim(), expected.trim());
//    });
//
//    test("1b", () {
//      var result = createValueT2(
//        false,
//        [NameTypeClassComment("type", "String", null)],
//        "\$Pet",
//        null,
//        [],
//        [],
//      );
//
//      var expected = """class Pet extends \$Pet {
//final String type;
//
//Pet({
//required this.type,
//});
//String toString() => "(Pet-type:\$type)";
//int get hashCode => hashObjects([type.hashCode]);
//bool operator ==(Object other) => identical(this, other) || other is Pet && runtimeType == other.runtimeType &&
//type == other.type;
//}""";
//
//      expect(result.trim(), expected.trim());
//    });
//
//    test("1c", () {
//      var result = createValueT2(
//        false,
//        [
//          NameTypeClassComment("type", "String", null),
//          NameTypeClassComment("age", "int", null),
//        ],
//        "\$Pet",
//        null,
//        [],
//        [],
//      );
//
//      var expected = """class Pet extends \$Pet {
//final String type;
//final int age;
//
//Pet({
//required this.type,
//required this.age,
//});
//String toString() => "(Pet-type:\$type|age:\$age)";
//int get hashCode => hashObjects([type.hashCode, age.hashCode]);
//bool operator ==(Object other) => identical(this, other) || other is Pet && runtimeType == other.runtimeType &&
//type == other.type && age == other.age;
//}""";
//
//      expect(result.trim(), expected.trim());
//    });
//
//    test("2a", () {
//      var result = createValueT2(
//        true,
//        [NameTypeClassComment("x", "T", null)],
//        "\$A",
//        null,
//        [],
//        [NameTypeClassComment("T", null, null)],
//      );
//
//      var expected = """abstract class A<T> extends \$A<T> {
//T get x;
//}""";
//
//      expect(result.trim(), expected.trim());
//    });
//
//    test("2b", () {
//      var result = createValueT2(
//        false,
//        [
//          NameTypeClassComment("x", "T", null),
//          NameTypeClassComment("p", "T3", null),
//          NameTypeClassComment("y", "T", null),
//          NameTypeClassComment("z", "String", null),
//        ],
//        "\$B",
//        "///Blah",
//        [
//          InterfaceWithComment("\$A", ["int"], ["T"], [], comment: "///blah2"),
//          Interface("\$C", [], [], [])
//        ],
//        [
//          NameTypeClassComment("T", "\$C", null),
//          NameTypeClassComment("T3", null, null),
//        ],
//      );
//
//      var expected = """
/////Blah
/////
/////implements [\$A]
/////
//
/////blah2
/////
//class B<T extends \$C, T3> extends \$B<T, T3> implements A<int>, C {
//final T x;
//final T3 p;
//final T y;
//final String z;
/////Blah
/////
/////implements [\$A]
/////
//
/////blah2
/////
//B({
//required this.x,
//required this.p,
//required this.y,
//required this.z,
//});
//String toString() => "(B-x:\$x|p:\$p|y:\$y|z:\$z)";
//int get hashCode => hashObjects([x.hashCode, p.hashCode, y.hashCode, z.hashCode]);
//bool operator ==(Object other) => identical(this, other) || other is B && runtimeType == other.runtimeType &&
//x == other.x && p == other.p && y == other.y && z == other.z;
//}""";
//
//      expect(result.trim(), expected.trim());
//    });
//
//    test("x", () {
//      var result = createValueT2(
//        false,
//        [NameTypeClassComment("type", "String", null)],
//        "\$Pet_",
//        null,
//        [],
//        [],
//      );
//
//      var expected = """class Pet_ extends \$Pet_ {
//final String type;
//
//Pet_._({
//required this.type,
//});
//String toString() => "(Pet_-type:\$type)";
//int get hashCode => hashObjects([type.hashCode]);
//bool operator ==(Object other) => identical(this, other) || other is Pet_ && runtimeType == other.runtimeType &&
//type == other.type;
//}""";
//
//      expect(result.trim(), expected.trim());
//    });
//  });
//}
