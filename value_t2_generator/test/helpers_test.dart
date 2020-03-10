import 'package:test/test.dart';
import 'package:value_t2_generator/src/classes.dart';
import 'package:value_t2_generator/src/helpers.dart';

void main() {
  group("getDistinctFields", () {
    test("1", () {
      var fields = [
        NameTypeClass("x", "T1", "A"),
        NameTypeClass("y", "T2", "A"),
        NameTypeClass("z", "String", "B"),
      ];

      var interfaces = [
        Interface("\$A", ["int", "String"], ["T1", "T2"]),
      ];

      var result = getDistinctFields(fields, interfaces, "A");

      var expected = [
        "x:int",
        "y:String",
        "z:String",
      ];

      expect(result.map((e) => e.toString()).toList(), expected);
    });

    test("1", () {
      var fields = [
        NameTypeClass("x", "T1", "A"),
        NameTypeClass("y", "T2", "A"),
        NameTypeClass("z", "String", "B"),
      ];

      var interfaces = [
        Interface("\$A", ["Ta", "Tb"], ["T1", "T2"]),
      ];

      var result = getDistinctFields(fields, interfaces, "A");

      var expected = [
        "x:Ta",
        "y:Tb",
        "z:String",
      ];

      expect(result.map((e) => e.toString()).toList(), expected);
    });
  });

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

  group("getExtendsGenerics", () {
    test("1", () {
      var result = getExtendsGenerics([NameType("T", "\$C")]);

      expect(result, "<T>");
    });

    test("1", () {
      var result = getExtendsGenerics([
        NameType("T", "\$C"),
        NameType("T2", "MyBase"),
        NameType("T3", null),
      ]);

      expect(result, "<T, T2, T3>");
    });
  });

  group("getImplements", () {
    test("1 - no interfaces", () {
      var result = getImplements([]);

      expect(result, "");
    });

    test("2", () {
      var result = getImplements([Interface("\$A", [], [])]);

      expect(result, " implements A");
    });

    test("3", () {
      var result = getImplements([
        Interface("\$B", ["int"], ["T1"]),
        Interface("\$C", [], ["T1"]),
      ]);

      expect(result, " implements B<int>, C");
    });
  });

  //where type and name are the same in the field list
  //from class A

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

    test("3 property from generic", () {
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
