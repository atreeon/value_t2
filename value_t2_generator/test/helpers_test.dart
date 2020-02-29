import 'package:test/test.dart';
import 'package:value_t2_generator/src/classes.dart';
import 'package:value_t2_generator/src/helpers.dart';

void main() {
  group("getClassDefinition", () {
    test("1", () {
      var result = getClassDefinition(false, "\$Pet");

      expect(result, "class Pet");
    });

    test("2", () {
      var result = getClassDefinition(true, "\$Pet");

      expect(result, "abstract class Pet");
    });
  });

  group("getClassGenerics", () {
    test("1", () {
      var result = getClassGenerics([NameType("T", "\$C")]);

      expect(result, "<T extends C>");
    });

    test("1", () {
      var result = getClassGenerics([
        NameType("T", "\$C"),
        NameType("T2", "MyBase"),
        NameType("T3", null),
      ]);

      expect(result, "<T extends C, T2 extends MyBase, T3>");
    });
  });

  group("getImplements", () {
    test("1 - no interfaces", () {
      var result = getImplements([]);

      expect(result, "");
    });

    test("2", () {
      var result = getImplements([Interface("\$A", [])]);

      expect(result, "implements A");
    });

    test("3", () {
      var result = getImplements([
        Interface("\$B", [int]),
        Interface("\$C", []),
      ]);

      expect(result, "implements B<int>, C");
    });
  });

  group("getProperties", () {
    test("1 - no properties", () {
      var result = getProperties([]);

      expect(result.toString(), "");
    });

    test("2", () {
      var result = getProperties([
        NameType("age", "int"),
        NameType("name", "String"),
      ]);

      expect(result.toString(), "final int age;\nfinal String name;");
    });
  });

  group("getPropertiesAbstract", () {
    test("1 - no properties", () {
      var result = getPropertiesAbstract([]);

      expect(result.toString(), "");
    });

    test("2", () {
      var result = getPropertiesAbstract([
        NameType("age", "int"),
        NameType("name", "String"),
      ]);

      expect(result.toString(), "int get age;\nString get name;");
    });
  });

  group("getConstructorRows", () {
    test("2", () {
      var result = getConstructorRows([
        NameType("age", "int"),
        NameType("name", "String"),
      ]);

      expect(result.toString(), "@required this.age,\n@required this.name,");
    });
  });

  group("getNullAsserts", () {
    test("2", () {
      var result = getNullAsserts([
        NameType("age", "int"),
        NameType("name", "String"),
      ]);

      expect(result.toString(), "assert(age != null),\nassert(name != null);");
    });
  });
}
