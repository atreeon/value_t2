import 'package:analyzer_models/analyzer_models.dart';
import 'package:test/test.dart';
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

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "x:int",
        "y:String",
        "z:String",
      ];

      expect(result.map((e) => e.toString()).toList(), expected);
    });

    test("2", () {
      var fields = [
        NameTypeClass("x", "T1", "A"),
        NameTypeClass("y", "T2", "A"),
        NameTypeClass("z", "String", "B"),
      ];

      var interfaces = [
        Interface("\$A", ["Ta", "Tb"], ["T1", "T2"]),
      ];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "x:Ta",
        "y:Tb",
        "z:String",
      ];

      expect(result.map((e) => e.toString()).toList(), expected);
    });

    test("3", () {
      var fields = [
        NameTypeClass("batch", "\$BS<\$BI>", "\$BQR"),
      ];

      var interfaces = <Interface>[];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "batch:BS<\$BI>",
      ];

      expect(result.map((e) => e.toString()).toList(), expected);
    });

    test("4", () {
      var fields = [
        NameTypeClass("batch", "\$\$BS<\$\$BI>", "\$BQR"),
      ];

      var interfaces = <Interface>[];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "batch:BS<\$\$BI>",
      ];

      expect(result.map((e) => e.toString()).toList(), expected);
    });

    test("5 ex11 - B", () {
      var fields = [
        NameTypeClass("x", "T1", "\$\$A"),
        NameTypeClass("y", "T2", "\$\$A"),
        NameTypeClass("z", "String", "\$B"),
      ];

      var interfaces = [
        Interface("\$\$A", ["int", "String"], ["T1", "T2"]),
      ];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "x:int",
        "y:String",
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
      var result = getClassDefinition(true, "\$\$Pet");

      expect(result, "abstract class Pet");
    });
  });

  group("getClassGenerics", () {
    test("1", () {
      var result = getClassGenerics([NameType("T", "\$C")]);

      expect(result, "<T extends \$C>");
    });

    test("2", () {
      var result = getClassGenerics([
        NameType("T", "\$\$C"),
        NameType("T2", "MyBase"),
        NameType("T3", null),
      ]);

      expect(result, "<T extends \$\$C, T2 extends MyBase, T3>");
    });
  });

  group("getExtendsGenerics", () {
    test("1", () {
      var result = getExtendsGenerics([NameType("T", "\$\$C")]);

      expect(result, "<T>");
    });

    test("2", () {
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
        Interface("\$C", [], []),
      ]);

      expect(result, " implements B<int>, C");
    });

    test("4", () {
      var result = getImplements([
        Interface("\$B", ["\$A"], ["T1"]),
      ]);

      expect(result, " implements B<\$A>");
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

    test("3", () {
      var result = getProperties([
        NameType("a", "\$BS"),
      ]);

      expect(result.toString(), "final \$BS a;");
    });

    test("4", () {
      var result = getProperties([
        NameType("a", "List<\$BS>"),
      ]);

      expect(result.toString(), "final List<\$BS> a;");
    });
  });

  group("getToString", () {
    test("1", () {
      var result = getToString([], "MyClass");

      expect(result.toString(), """String toString() => "(MyClass-)""");
    });

    test("2", () {
      var result = getToString([
        NameType("a", "int"),
        NameType("b", "String"),
        NameType("c", "String"),
      ], "MyClass");

      expect(result.toString(), """String toString() => "(MyClass-a:\$a|b:\$b|c:\$c)";""");
    });
  });

  group("getHashCode", () {
    test("1", () {
      var result = getHashCode([]);

      expect(result.toString(), "");
    });

    test("2", () {
      var result = getHashCode([
        NameType("a", "int"),
        NameType("b", "String"),
        NameType("c", "String"),
      ]);

      expect(result.toString(), //
          """int get hashCode => hashObjects([a.hashCode, b.hashCode, c.hashCode]);""");
    });
  });

  group("getEquals", () {
    test("1", () {
      var result = getEquals([], "A");

      var expected = """bool operator ==(Object other) => identical(this, other) || other is A && runtimeType == other.runtimeType
;""";

      expect(result, expected);
    });

    test("2", () {
      var result = getEquals([
        NameType("a", "int"),
        NameType("b", "String"),
        NameType("c", "String"),
      ], "C");

      var expected = """bool operator ==(Object other) => identical(this, other) || other is C && runtimeType == other.runtimeType &&
a == other.a && b == other.b && c == other.c;""";

      expect(result, expected);
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
      var result = getConstructorRows(
        [
          NameType("age", "int"),
          NameType("name", "String"),
        ],
        [],
      );

      expect(result.toString(), "@required this.age,\n@required this.name,");
    });

    test("3", () {
      var result = getConstructorRows(
        [
          NameType("age", "int"),
          NameType("name", "String"),
        ],
        ["name"],
      );

      expect(result.toString(), "@required this.age,\nthis.name,");
    });
  });

  group("getNullAsserts", () {
    test("2", () {
      var result = getNullAsserts(
        [
          NameType("age", "int"),
          NameType("name", "String"),
        ],
        [],
      );

      expect(result.toString(), "assert(age != null),\nassert(name != null);");
    });

    test("3", () {
      var result = getNullAsserts(
        [
          NameType("age", "int"),
          NameType("name", "String"),
        ],
        ["name"],
      );

      expect(result.toString(), "assert(age != null);");
    });
  });

  group("removeDollarsFromPropertyType", () {
    test("1", () {
      var input = r"batch:$BS<$BI>";
      var result = removeDollarsFromPropertyType(input);

      expect(result, r"batch:BS<$BI>");
    });

    test("2", () {
      var input = r"batch:$$BS<$$BI>";
      var result = removeDollarsFromPropertyType(input);

      expect(result, r"batch:BS<$$BI>");
    });
  });

  group("getConstructorName", () {
    test("1 normalc", () {
      var result = getConstructorName("MyClass");
      expect(result, "MyClass");
    });

    test("2 privatec", () {
      var result = getConstructorName("MyClass_");

      expect(result, "MyClass_._");
    });
  });
}
