import 'package:analyzer_models/analyzer_models.dart';
import 'package:test/test.dart';
import 'package:value_t2_generator/src/classes.dart';
import 'package:value_t2_generator/src/helpers.dart';

void main() {
  group("getClassComment", () {
    test("1x", () {
      var interfaces = [
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"]),
      ];

      var result = getClassComment(interfaces, "///blah");

      expect(result, """///blah
///
///implements [\$A]
///

///
""");
    });

    test("2x null class comment", () {
      var interfaces = [
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"]),
      ];

      var result = getClassComment(interfaces, "");

      expect(result, """///
///implements [\$A]
///

///
""");
    });

    test("3x with all comments", () {
      var interfaces = [
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"], comment: "///blah1"),
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"]),
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"], comment: "///blah2"),
      ];

      var result = getClassComment(interfaces, "///blah");

      expect(result, """///blah
///
///implements [\$A]
///

///blah1
///
///implements [\$A]
///

///
///implements [\$A]
///

///blah2
///
""");
    });
  });

  group("getDistinctFields", () {
    test("1a", () {
      var fields = [
        NameTypeClassWithComment("x", "T1", "A"),
        NameTypeClassWithComment("y", "T2", "A"),
        NameTypeClassWithComment("z", "String", "B"),
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

    test("2a", () {
      var fields = [
        NameTypeClassWithComment("x", "T1", "A"),
        NameTypeClassWithComment("y", "T2", "A"),
        NameTypeClassWithComment("z", "String", "B"),
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

    test("3a", () {
      var fields = [
        NameTypeClassWithComment("batch", "\$BS<\$BI>", "\$BQR"),
      ];

      var interfaces = <Interface>[];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "batch:BS<\$BI>",
      ];

      expect(result.map((e) => e.toString()).toList(), expected);
    });

    test("4a", () {
      var fields = [
        NameTypeClassWithComment("batch", "\$\$BS<\$\$BI>", "\$BQR"),
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
        NameTypeClassWithComment("x", "T1", "\$\$A"),
        NameTypeClassWithComment("y", "T2", "\$\$A"),
        NameTypeClassWithComment("z", "String", "\$B"),
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
    test("1b", () {
      var result = getClassDefinition(false, "\$Pet");

      expect(result, "class Pet");
    });

    test("2b", () {
      var result = getClassDefinition(true, "\$\$Pet");

      expect(result, "abstract class Pet");
    });
  });

  group("getClassGenerics", () {
    test("1c", () {
      var result = getClassGenerics([NameTypeWithComment("T", "\$C")]);

      expect(result, "<T extends \$C>");
    });

    test("2c", () {
      var result = getClassGenerics([
        NameTypeWithComment("T", "\$\$C"),
        NameTypeWithComment("T2", "MyBase"),
        NameTypeWithComment("T3", null),
      ]);

      expect(result, "<T extends \$\$C, T2 extends MyBase, T3>");
    });
  });

  group("getExtendsGenerics", () {
    test("1d", () {
      var result = getExtendsGenerics([NameTypeWithComment("T", "\$\$C")]);

      expect(result, "<T>");
    });

    test("2d", () {
      var result = getExtendsGenerics([
        NameTypeWithComment("T", "\$C"),
        NameTypeWithComment("T2", "MyBase"),
        NameTypeWithComment("T3", null),
      ]);

      expect(result, "<T, T2, T3>");
    });
  });

  group("getImplements", () {
    test("1 - no interfaces", () {
      var result = getImplements([]);

      expect(result, "");
    });

    test("2e", () {
      var result = getImplements([Interface("\$A", [], [])]);

      expect(result, " implements A");
    });

    test("3e", () {
      var result = getImplements([
        Interface("\$B", ["int"], ["T1"]),
        Interface("\$C", [], []),
      ]);

      expect(result, " implements B<int>, C");
    });

    test("4e", () {
      var result = getImplements([
        Interface("\$B", ["\$A"], ["T1"]),
      ]);

      expect(result, " implements B<\$A>");
    });
  });

  //where type and name are the same in the field list
  //from class A

  group("getProperties", () {
    test("1f - no properties", () {
      var result = getProperties([]);

      expect(result.toString(), "");
    });

    test("2f", () {
      var result = getProperties([
        NameTypeWithComment("age", "int"),
        NameTypeWithComment("name", "String"),
      ]);

      expect(result.toString(), "final int age;\nfinal String name;");
    });

    test("3f", () {
      var result = getProperties([
        NameTypeWithComment("a", "\$BS"),
      ]);

      expect(result.toString(), "final \$BS a;");
    });

    test("4f", () {
      var result = getProperties([
        NameTypeWithComment("a", "List<\$BS>"),
      ]);

      expect(result.toString(), "final List<\$BS> a;");
    });

    test("5f", () {
      var result = getProperties([
        NameTypeWithComment("age", "int"),
        NameTypeWithComment("name", "String", comment: "///blah"),
      ]);

      expect(result.toString(), "final int age;\n///blah\nfinal String name;");
    });

    test("6f remove dollars from valuet2 types", () {
      var result = getProperties([
        NameTypeWithComment("schedules", "List<\$ScheduleVM_Item>"),
      ]);

      expect(result.toString(), "final List<ScheduleVM_Item> schedules;");
    });
  });

  group("getToString", () {
    test("1g", () {
      var result = getToString([], "MyClass");

      expect(result.toString(), """String toString() => "(MyClass-)""");
    });

    test("2g", () {
      var result = getToString([
        NameTypeWithComment("a", "int"),
        NameTypeWithComment("b", "String"),
        NameTypeWithComment("c", "String"),
      ], "MyClass");

      expect(result.toString(), """String toString() => "(MyClass-a:\$a|b:\$b|c:\$c)";""");
    });
  });

  group("getHashCode", () {
    test("1h", () {
      var result = getHashCode([]);

      expect(result.toString(), "");
    });

    test("2h", () {
      var result = getHashCode([
        NameTypeWithComment("a", "int"),
        NameTypeWithComment("b", "String"),
        NameTypeWithComment("c", "String"),
      ]);

      expect(result.toString(), //
          """int get hashCode => hashObjects([a.hashCode, b.hashCode, c.hashCode]);""");
    });
  });

  group("getEquals", () {
    test("1i", () {
      var result = getEquals([], "A");

      var expected = """bool operator ==(Object other) => identical(this, other) || other is A && runtimeType == other.runtimeType
;""";

      expect(result, expected);
    });

    test("2i", () {
      var result = getEquals([
        NameTypeWithComment("a", "int"),
        NameTypeWithComment("b", "String"),
        NameTypeWithComment("c", "String"),
      ], "C");

      var expected = """bool operator ==(Object other) => identical(this, other) || other is C && runtimeType == other.runtimeType &&
a == other.a && b == other.b && c == other.c;""";

      expect(result, expected);
    });
  });

  group("getPropertiesAbstract", () {
    test("1j - no properties", () {
      var result = getPropertiesAbstract([]);

      expect(result.toString(), "");
    });

    test("2j", () {
      var result = getPropertiesAbstract([
        NameTypeWithComment("age", "int"),
        NameTypeWithComment("name", "String"),
      ]);

      expect(result.toString(), "int get age;\nString get name;");
    });

    test("3j", () {
      var result = getPropertiesAbstract([
        NameTypeWithComment("age", "int", comment: "///blah blah"),
        NameTypeWithComment("name", "String"),
      ]);

      expect(result.toString(), "///blah blah\nint get age;\nString get name;");
    });
  });

  group("getConstructorRows", () {
    test("2k", () {
      var result = getConstructorRows(
        [
          NameTypeWithComment("age", "int"),
          NameTypeWithComment("name", "String"),
        ],
      );

      expect(result.toString(), "required this.age,\nrequired this.name,");
    });

    test("3k with null list", () {
      var result = getConstructorRows(
        [
          NameTypeWithComment("age", "int"),
          NameTypeWithComment("name", "String?"),
        ],
      );

      expect(result.toString(), "required this.age,\nthis.name,");
    });
  });

  group("removeDollarsFromPropertyType", () {
    test("1m", () {
      var input = r"batch:$BS<$BI>";
      var result = removeDollarsFromPropertyType(input);

      expect(result, r"batch:BS<$BI>");
    });

    test("2m", () {
      var input = r"batch:$$BS<$$BI>";
      var result = removeDollarsFromPropertyType(input);

      expect(result, r"batch:BS<$$BI>");
    });
  });

  group("getConstructorName", () {
    test("1n normalc", () {
      var result = getConstructorName("MyClass");
      expect(result, "MyClass");
    });

    test("2n privatec", () {
      var result = getConstructorName("MyClass_");

      expect(result, "MyClass_._");
    });
  });
}
