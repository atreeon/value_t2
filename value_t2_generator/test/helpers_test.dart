//import 'package:analyzer_models/analyzer_models.dart';
import 'package:generator_common/NameType.dart';
import 'package:generator_common/classes.dart';
import 'package:test/test.dart';
import 'package:value_t2_generator/src/helpers.dart';

void main() {
  group("getClassComment", () {
    test("1x", () {
      var interfaces = [
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"], []),
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
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"], []),
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
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"], [], comment: "///blah1"),
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"], []),
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"], [], comment: "///blah2"),
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
        NameTypeClassComment("x", "T1", "A"),
        NameTypeClassComment("y", "T2", "A"),
        NameTypeClassComment("z", "String", "B"),
      ];

      var interfaces = [
        InterfaceWithComment("\$A", ["int", "String"], ["T1", "T2"], []),
      ];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "x:int",
        "y:String",
        "z:String",
      ];

      expect(result.map((e) => e.toStringNameType()).toList(), expected);
    });

    test("2a", () {
      var fields = [
        NameTypeClassComment("x", "T1", "A"),
        NameTypeClassComment("y", "T2", "A"),
        NameTypeClassComment("z", "String", "B"),
      ];

      var interfaces = [
        InterfaceWithComment("\$A", ["Ta", "Tb"], ["T1", "T2"], []),
      ];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "x:Ta",
        "y:Tb",
        "z:String",
      ];

      expect(result.map((e) => e.toStringNameType()).toList(), expected);
    });

    test("3a", () {
      var fields = [
        NameTypeClassComment("batch", "\$BS<\$BI>", "\$BQR"),
      ];

      var interfaces = <InterfaceWithComment>[];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "batch:BS<\$BI>",
      ];

      expect(result.map((e) => e.toStringNameType()).toList(), expected);
    });

    test("4a", () {
      var fields = [
        NameTypeClassComment("batch", "\$\$BS<\$\$BI>", "\$BQR"),
      ];

      var interfaces = <InterfaceWithComment>[];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "batch:BS<\$\$BI>",
      ];

      expect(result.map((e) => e.toStringNameType()).toList(), expected);
    });

    test("5 ex11 - B", () {
      var fields = [
        NameTypeClassComment("x", "T1", "\$\$A"),
        NameTypeClassComment("y", "T2", "\$\$A"),
        NameTypeClassComment("z", "String", "\$B"),
      ];

      var interfaces = [
        InterfaceWithComment("\$\$A", ["int", "String"], ["T1", "T2"], []),
      ];

      var result = getDistinctFields(fields, interfaces);

      var expected = [
        "x:int",
        "y:String",
        "z:String",
      ];

      expect(result.map((e) => e.toStringNameType()).toList(), expected);
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
      var result = getClassGenerics([NameTypeClassComment("T", "\$C", null)]);

      expect(result, "<T extends \$C>");
    });

    test("2c", () {
      var result = getClassGenerics([
        NameTypeClassComment("T", "\$\$C", null),
        NameTypeClassComment("T2", "MyBase", null),
        NameTypeClassComment("T3", null, null),
      ]);

      expect(result, "<T extends \$\$C, T2 extends MyBase, T3>");
    });
  });

  group("getExtendsGenerics", () {
    test("1d", () {
      var result = getExtendsGenerics([NameTypeClassComment("T", "\$\$C", null)]);

      expect(result, "<T>");
    });

    test("2d", () {
      var result = getExtendsGenerics([
        NameTypeClassComment("T", "\$C", null),
        NameTypeClassComment("T2", "MyBase", null),
        NameTypeClassComment("T3", null, null),
      ]);

      expect(result, "<T, T2, T3>");
    });
  });

  group("getImplements", () {
    test("1 - no interfaces", () {
      var result = getImplements([], "MyClass");

      expect(result, "");
    });

    test("2e", () {
      var result = getImplements([Interface("\$A", [], [], [])], "MyClass");

      expect(result, " implements A");
    });

    test("3e", () {
      var result = getImplements([
        Interface("\$B", ["int"], ["T1"], []),
        Interface("\$C", [], [], []),
      ], "MyClass");

      expect(result, " implements B<int>, C");
    });

    test("4e", () {
      var result = getImplements([
        Interface("\$B", ["\$A"], ["T1"], []),
      ], "MyClass");

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
        NameTypeClassComment("age", "int", null),
        NameTypeClassComment("name", "String", null),
      ]);

      expect(result.toString(), "final int age;\nfinal String name;");
    });

    test("3f", () {
      var result = getProperties([
        NameTypeClassComment("a", "\$BS", null),
      ]);

//      expect(result.toString(), "final \$BS a;");
      expect(result.toString(), "final BS a;");
    });

    test("4f", () {
      var result = getProperties([
        NameTypeClassComment("a", "List<\$BS>", null),
      ]);

//      expect(result.toString(), "final List<\$BS> a;");
      expect(result.toString(), "final List<BS> a;");
    });

    test("5f", () {
      var result = getProperties([
        NameTypeClassComment("age", "int", null),
        NameTypeClassComment("name", "String", null, comment: "///blah"),
      ]);

      expect(result.toString(), "final int age;\n///blah\nfinal String name;");
    });

    test("6f remove dollars from valuet2 types", () {
      var result = getProperties([
        NameTypeClassComment("schedules", "List<\$ScheduleVM_Item>", null),
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
        NameTypeClassComment("a", "int", null),
        NameTypeClassComment("b", "String", null),
        NameTypeClassComment("c", "String", null),
      ], "MyClass");

      expect(result.toString(), """String toString() => "(MyClass-a:\${a.toString()}|b:\${b.toString()}|c:\${c.toString()})";""");
    });
  });

  group("getHashCode", () {
    test("1h", () {
      var result = getHashCode([]);

      expect(result.toString(), "");
    });

    test("2h", () {
      var result = getHashCode([
        NameTypeClassComment("a", "int", null),
        NameTypeClassComment("b", "String", null),
        NameTypeClassComment("c", "String", null),
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
        NameTypeClassComment("a", "int", null),
        NameTypeClassComment("b", "String", null),
        NameTypeClassComment("c", "String", null),
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
        NameTypeClassComment("age", "int", null),
        NameTypeClassComment("name", "String", null),
      ]);

      expect(result.toString(), "int get age;\nString get name;");
    });

    test("3j", () {
      var result = getPropertiesAbstract([
        NameTypeClassComment("age", "int", null, comment: "///blah blah"),
        NameTypeClassComment("name", "String", null),
      ]);

      expect(result.toString(), "///blah blah\nint get age;\nString get name;");
    });
  });

  group("getConstructorRows", () {
    test("2k", () {
      var result = getConstructorRows(
        [
          NameTypeClassComment("age", "int", null),
          NameTypeClassComment("name", "String", null),
        ],
      );

      expect(result.toString(), "required this.age,\nrequired this.name,");
    });

    test("3k with null list", () {
      var result = getConstructorRows(
        [
          NameTypeClassComment("age", "int", null),
          NameTypeClassComment("name", "String?", null),
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

    test("3m if a single value, remove the dollars", () {
      var result = removeDollarsFromPropertyType("\$Word");
      expect(result, "Word");
    });

    test("4m if a Function data type and we have a valueT2 class then don't remove", () {
      var result = removeDollarsFromPropertyType("bool Function(int blah, \$X blim)");
      expect(result, "bool Function(int blah, \$X blim)");
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

  group("getEnumPropertyList", () {
    test("1o", () {
      var result = getEnumPropertyList(
        [
          NameTypeClassComment("age", "int", null),
          NameTypeClassComment("name", "String?", null),
        ],
        "\$MyClass",
      );
      expect(result, "enum MyClass\$ {age,name}");
    });

    test("2o no fields", () {
      var result = getEnumPropertyList(
        [],
        "\$MyClass",
      );
      expect(result, "");
    });
  });

  group("getCopyWith", () {
    test("1p abstract classname is interfacename", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceName: "A",
        className: "A",
        isClassAbstract: true,
        interfaceGenerics: [],
      );
      expect(result, """A cwA({
Opt<String>? a,
});""");
    });

    test("2p abstract", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "int", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "int", null),
          NameTypeClassComment("b", "int", null),
        ],
        interfaceName: "A",
        className: "B",
        isClassAbstract: true,
        interfaceGenerics: [],
      );
      expect(result, """B cwA({
Opt<int>? a,
});""");
    });

    test("3p classname is interfacename", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceName: "A",
        className: "A",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """A cwA({
Opt<String>? a,
}) {
return A(
a: a == null ? this.a as String : a.value as String,
);
}""");
    });

    test("4p ba (see ex29_manual)", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceName: "A",
        className: "B",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """B cwA({
Opt<String>? a,
}) {
return B(
a: a == null ? this.a as String : a.value as String,
b: (this as B).b,
);
}""");
    });

    test("5p bb (see ex29_manual)", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
        ],
        interfaceName: "B",
        className: "B",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """B cwB({
Opt<String>? a,
Opt<T1>? b,
}) {
return B(
a: a == null ? this.a as String : a.value as String,
b: b == null ? this.b as T1 : b.value as T1,
);
}""");
    });

    test("6p ca (see ex29_manual)", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
          NameTypeClassComment("c", "bool", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceName: "A",
        className: "C",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """C cwA({
Opt<String>? a,
}) {
return C(
a: a == null ? this.a as String : a.value as String,
b: (this as C).b,
c: (this as C).c,
);
}""");
    });

    test("7p cb (see ex29_manual)", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
          NameTypeClassComment("c", "bool", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
        ],
        interfaceName: "B",
        className: "C",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """C cwB({
Opt<String>? a,
Opt<T1>? b,
}) {
return C(
a: a == null ? this.a as String : a.value as String,
b: b == null ? this.b as T1 : b.value as T1,
c: (this as C).c,
);
}""");
    });

    test("8p cc (see ex29_manual)", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
          NameTypeClassComment("c", "bool", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
          NameTypeClassComment("c", "bool", null),
        ],
        interfaceName: "C",
        className: "C",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """C cwC({
Opt<String>? a,
Opt<T1>? b,
Opt<bool>? c,
}) {
return C(
a: a == null ? this.a as String : a.value as String,
b: b == null ? this.b as T1 : b.value as T1,
c: c == null ? this.c as bool : c.value as bool,
);
}""");
    });

    test("9p da (see ex29_manual) class with no fields", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceName: "A",
        className: "D",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """D cwA({
Opt<String>? a,
}) {
return D(
a: a == null ? this.a as String : a.value as String,
b: (this as D).b,
);
}""");
    });

    test("10p db (see ex29_manual) class with no fields", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
        ],
        interfaceName: "B",
        className: "D",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """D cwB({
Opt<String>? a,
Opt<T1>? b,
}) {
return D(
a: a == null ? this.a as String : a.value as String,
b: b == null ? this.b as T1 : b.value as T1,
);
}""");
    });

    test("11p dd (see ex29_manual) class with no fields", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
          NameTypeClassComment("b", "T1", null),
        ],
        interfaceName: "D",
        className: "D",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """D cwD({
Opt<String>? a,
Opt<T1>? b,
}) {
return D(
a: a == null ? this.a as String : a.value as String,
b: b == null ? this.b as T1 : b.value as T1,
);
}""");
    });

    test("12p x (see ex29_manual) interface with no fields", () {
      var result = getCopyWith(
        classFields: [],
        interfaceFields: [],
        interfaceName: "X",
        className: "X",
        isClassAbstract: true,
        interfaceGenerics: [],
      );
      expect(result, """X cwX(
);""");
    });

    test("13p yx (see ex29_manual) interface with no fields", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceFields: [],
        interfaceName: "X",
        className: "Y",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """Y cwX(
) {
return Y(
a: (this as Y).a,
);
}""");
    });

    test("14p yy (see ex29_manual) interface with no fields", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceName: "Y",
        className: "Y",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """Y cwY({
Opt<String>? a,
}) {
return Y(
a: a == null ? this.a as String : a.value as String,
);
}""");
    });

    test("15p aa (see ex7_manual) where subtypes are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "Person", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "Person", null),
        ],
        interfaceName: "A",
        className: "A",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """A cwA({
Opt<Person>? a,
}) {
return A(
a: a == null ? this.a as Person : a.value as Person,
);
}""");
    });

    test("16p ba (see ex7_manual) where subtypes are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "Employee", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "Person", null),
        ],
        interfaceName: "A",
        className: "B",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """B cwA({
Opt<Person>? a,
}) {
return B(
a: a == null ? this.a as Employee : a.value as Employee,
);
}""");
    });

    test("17p bb (see ex7_manual) where subtypes are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "Employee", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "Employee", null),
        ],
        interfaceName: "B",
        className: "B",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """B cwB({
Opt<Employee>? a,
}) {
return B(
a: a == null ? this.a as Employee : a.value as Employee,
);
}""");
    });

    test("18p ca (see ex7_manual) where subtypes are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "Manager", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "Person", null),
        ],
        interfaceName: "A",
        className: "C",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """C cwA({
Opt<Person>? a,
}) {
return C(
a: a == null ? this.a as Manager : a.value as Manager,
);
}""");
    });

    test("19p cb (see ex7_manual) where subtypes are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "Manager", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "Employee", null),
        ],
        interfaceName: "B",
        className: "C",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """C cwB({
Opt<Employee>? a,
}) {
return C(
a: a == null ? this.a as Manager : a.value as Manager,
);
}""");
    });

    test("20p cc (see ex7_manual) where subtypes are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "Manager", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "Manager", null),
        ],
        interfaceName: "C",
        className: "C",
        isClassAbstract: false,
        interfaceGenerics: [],
      );
      expect(result, """C cwC({
Opt<Manager>? a,
}) {
return C(
a: a == null ? this.a as Manager : a.value as Manager,
);
}""");
    });

    test("21p ba (see ex11_manual) where subtypes are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("x", "int", null),
          NameTypeClassComment("y", "String", null),
          NameTypeClassComment("z", "String", null),
        ],
        interfaceFields: [
          NameTypeClassComment("x", "T1", null),
          NameTypeClassComment("y", "T2", null),
        ],
        interfaceGenerics: [NameType("T1", null), NameType("T2", null)],
        interfaceName: "A",
        className: "B",
        isClassAbstract: false,
      );
      expect(result, """B cwA<T1, T2>({
Opt<T1>? x,
Opt<T2>? y,
}) {
return B(
x: x == null ? this.x as int : x.value as int,
y: y == null ? this.y as String : y.value as String,
z: (this as B).z,
);
}""");
    });

    test("22p bb (see ex11_manual) where subtypes are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("x", "int", null),
          NameTypeClassComment("y", "String", null),
          NameTypeClassComment("z", "String", null),
        ],
        interfaceFields: [
          NameTypeClassComment("x", "int", null),
          NameTypeClassComment("y", "String", null),
          NameTypeClassComment("z", "String", null),
        ],
        interfaceGenerics: [],
        interfaceName: "B",
        className: "B",
        isClassAbstract: false,
      );
      expect(result, """B cwB({
Opt<int>? x,
Opt<String>? y,
Opt<String>? z,
}) {
return B(
x: x == null ? this.x as int : x.value as int,
y: y == null ? this.y as String : y.value as String,
z: z == null ? this.z as String : z.value as String,
);
}""");
    });

    test("23p a (see ex2_manual) where generics are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("x", "T", null),
        ],
        interfaceFields: [
          NameTypeClassComment("x", "T", null),
        ],
        interfaceGenerics: [NameType("T", null)],
        interfaceName: "A",
        className: "A",
        isClassAbstract: true,
      );
      expect(result, """A cwA<T>({
Opt<T>? x,
});""");
    });

    test("24p a (see ex2_manual) where generics are used", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("x", "int", null),
          NameTypeClassComment("y", "T", null),
        ],
        interfaceFields: [
          NameTypeClassComment("x", "T", null),
        ],
        interfaceGenerics: [NameType("T", null)],
//        classGenerics: [NameType("T", "\$C")],
        interfaceName: "A",
        className: "B",
        isClassAbstract: false,
      );
      expect(result, """B cwA<T>({
Opt<T>? x,
}) {
return B(
x: x == null ? this.x as int : x.value as int,
y: (this as B).y,
);
}""");
    });

    test("25p a (see ex21) no default constructor", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceFields: [
          NameTypeClassComment("a", "String", null),
        ],
        interfaceGenerics: [],
        interfaceName: "A_",
        className: "A_",
        isClassAbstract: false,
      );
      expect(result, """A_ cwA_({
Opt<String>? a,
}) {
return A_._(
a: a == null ? this.a as String : a.value as String,
);
}""");
    });

    test("26p function to leave in dollar", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("fn", "bool Function(\$X)", null),
        ],
        interfaceFields: [
          NameTypeClassComment("fn", "bool Function(\$X)", null),
        ],
        interfaceGenerics: [],
        interfaceName: "X",
        className: "X",
        isClassAbstract: false,
      );
      expect(result, """X cwX({
Opt<bool Function(\$X)>? fn,
}) {
return X(
fn: fn == null ? this.fn as bool Function(\$X) : fn.value as bool Function(\$X),
);
}""");
    });

    test("27p subtype from a supertype", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("x", "String", null),
        ],
        interfaceFields: [
          NameTypeClassComment("x", "String", null),
          NameTypeClassComment("y", "String", null),
        ],
        interfaceGenerics: [],
        interfaceName: "\$B",
        className: "A",
        isClassAbstract: false,
        isExplicitSubType: true,
      );
      expect(result, """B copyToB({
required String y,
Opt<String>? x,
}) {
return B(
y: y as String,
x: x == null ? this.x as String : x.value as String,
);
}""");
    });

    test("28p subtype from a supertype", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("x", "String", null),
        ],
        interfaceFields: [
          NameTypeClassComment("x", "String", null),
          NameTypeClassComment("y", "String", null),
          NameTypeClassComment("z", "\$Z", null),
        ],
        interfaceGenerics: [],
        interfaceName: "\$B",
        className: "A",
        isClassAbstract: false,
        isExplicitSubType: true,
      );
      expect(result, """B copyToB({
required String y,
required Z z,
Opt<String>? x,
}) {
return B(
y: y as String,
z: z as Z,
x: x == null ? this.x as String : x.value as String,
);
}""");
    });

    test("29p sub to sub sibling with abstract parent", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("x", "String", null),
        ],
        interfaceFields: [
          NameTypeClassComment("x", "String", null),
          NameTypeClassComment("y", "String", null),
          NameTypeClassComment("z", "\$Z", null),
        ],
        interfaceGenerics: [],
        interfaceName: "\$B",
        className: "A",
        isClassAbstract: false,
        isExplicitSubType: true,
      );
      expect(result, """B copyToB({
required String y,
required Z z,
Opt<String>? x,
}) {
return B(
y: y as String,
z: z as Z,
x: x == null ? this.x as String : x.value as String,
);
}""");
    });

    test("30p function to leave in dollar", () {
      var result = getCopyWith(
        classFields: [
          NameTypeClassComment("x", "String", null),
          NameTypeClassComment("cs", "List<\$C>", null),
          NameTypeClassComment("z", "\$Z", null),
        ],
        interfaceFields: [
          NameTypeClassComment("x", "String", null),
          NameTypeClassComment("cs", "List<\$C>", null),
          NameTypeClassComment("z", "\$Z", null),
        ],
        interfaceGenerics: [],
        interfaceName: "\$B",
        className: "\$B",
        isClassAbstract: false,
      );
      expect(result, """B cwB({
Opt<String>? x,
Opt<List<C>>? cs,
Opt<Z>? z,
}) {
return B(
x: x == null ? this.x as String : x.value as String,
cs: cs == null ? this.cs as List<C> : cs.value as List<C>,
z: z == null ? this.z as Z : z.value as Z,
);
}""");
    });
  });

  group("remove dollars from data type", () {
    test("1q if a single value, remove the dollars", () {
      var result = getDataTypeWithoutDollars("\$Word");
      expect(result, "Word");
    });

    test("2q if a Function data type and we have a valueT2 class then don't remove", () {
      var result = getDataTypeWithoutDollars("bool Function(int blah, \$X blim)");
      expect(result, "bool Function(int blah, \$X blim)");
    });
  });

//  group("getCopyWithSignature", () {
//    test("1p", () {
//      var result = getCopyWithSignature(
//        [
//          NameTypeClassComment("a", "int", null),
//          NameTypeClassComment("b", "String?", null),
//        ],
//        "A",
//      );
//      expect(result, """A cwA({
//required int a,
//required String? b,
//}) {""");
//    });
//  });

//  group("getValueTImplements", () {
//    test("1q - no interfaces", () {
//      var result = getValueTImplements([], "MyClass").map((e) => e.type).toList();
//
//      expect(result, ["MyClass"]);
//    });
////
////    test("2q", () {
////      var result = getImplements([Interface("\$A", [], [])], "MyClass");
////
////      expect(result, " implements A, ValueT");
////    });
////
////    test("3q", () {
////      var result = getImplements([
////        Interface("\$B", ["int"], ["T1"]),
////        Interface("\$C", [], []),
////      ], "MyClass");
////
////      expect(result, " implements B<int>, C, ValueT");
////    });
////
////    test("4q", () {
////      var result = getImplements([
////        Interface("\$B", ["\$A"], ["T1"]),
////      ], "MyClass");
////
////      expect(result, " implements B<\$A>, ValueT");
////    });
//  });
}
