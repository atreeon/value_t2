import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'readme_test.g.dart';

part 'readme_test.valuet2.dart';

@ValueT2(generateJson: true, explicitSubTypes: [$Cat])
abstract class $Pet {
  String get name;

  int get age;
}

@ValueT2(generateJson: true)
abstract class $FrankensteinsDogCat implements $Dog, $Cat {}

@ValueT2(generateJson: true)
abstract class $Cat implements $Pet {
  double get whiskerLength;
}

@ValueT2(generateJson: true)
abstract class $Dog implements $Pet {
  String get woofSound;
}

enum eFishColour { gold, silver, nemo }

@ValueT2(generateJson: true)
abstract class $Fish implements $Pet {
  eFishColour get fishColour;
}

@valueT2
abstract class $PetOwner<TPet extends $Pet> {
  String get ownerName;

  TPet get pet;
}

@valueT2
abstract class $A_ {
  String get val;

  DateTime get timestamp;
}

@valueT2
abstract class $B {
  String get val;

  String? get optional;
}

@ValueT2(generateJson: true, explicitSubTypes: [$Z, $Y])
abstract class $X {
  String get val;
}

@ValueT2(generateJson: true, explicitSubTypes: [$Z])
abstract class $Y implements $X {
  int get valY;
}

@ValueT2(generateJson: true)
abstract class $Z implements $Y {
  double get valZ;
}

main() {
  test("1", () {
    var flossy = Pet(name: "Flossy", age: 5);

    expect(flossy.name, "Flossy");
  });

  test("2 equality", () {
    var flossy1 = Pet(name: "Flossy", age: 5);
    var flossy2 = Pet(name: "Flossy", age: 5);

    expect(flossy1 == flossy2, true);
  });

  test("3 CopyWith simple", () {
    var flossy = Pet(name: "Flossy", age: 5);
    var plossy = flossy.copyWith_Pet(name: Opt("Plossy"));

    expect(flossy.age, plossy.age);
  });

  test("4 toString", () {
    var flossy = Pet(name: "Flossy", age: 5);

    expect(flossy.toString(), "(Pet-name:Flossy|age:5)");
  });

  test("5 Inheritance", () {
    var bagpussCat = Cat(whiskerLength: 13.75, name: "Bagpuss", age: 4);

    expect(bagpussCat.whiskerLength, 13.75);
  });

  test("6 CopyWith Polymorphic", () {
    var pets = [
      Cat(whiskerLength: 13.75, name: "Bagpuss", age: 4),
      Dog(woofSound: "rowf", name: "Colin", age: 4),
    ];

    var petsOlder = pets //
        .map((e) => e.copyWith_Pet(age: Opt(e.age + 1)))
        .toList();

    expect(petsOlder[0].age, 5);
    expect(petsOlder[1].age, 5);

    expect(petsOlder[0].runtimeType, Cat);
    expect(petsOlder[1].runtimeType, Dog);
  });

  test("7 Enums", () {
    var goldie = Fish(fishColour: eFishColour.gold, name: "Goldie", age: 2);
    expect(goldie.fishColour, eFishColour.gold);
  });

  test("8 Generics", () {
    var bagpussCat = Cat(whiskerLength: 13.75, name: "Bagpuss", age: 4);
    var colin = Dog(woofSound: "rowf", name: "Colin", age: 4);

    var cathy = PetOwner<Cat>(ownerName: "Cathy", pet: bagpussCat);
    var dougie = PetOwner<Dog>(ownerName: "Dougie", pet: colin);

    expect(cathy.pet.whiskerLength, 13.75);
    expect(dougie.pet.woofSound, "rowf");
  });

  test("9 Change To", () {
    var flossy = Pet(name: "Flossy", age: 5);

    var bagpussCat = flossy.changeTo_Cat(whiskerLength: 13.75);

    expect(bagpussCat.whiskerLength, 13.75);
    expect(bagpussCat.runtimeType, Cat);
  });

  test("10 Multiple Inheritance", () {
    var frankie = FrankensteinsDogCat(whiskerLength: 13.75, woofSound: "rowf", name: "frankie", age: 1);

    expect(frankie is Cat, true);
    expect(frankie is Dog, true);
  });

  A_ a_Constructor(String val) {
    return A_._(val: val, timestamp: DateTime(2023, 11, 25));
  }

  test("11 Custom Constructor", () {
    var a = a_Constructor("my value");

    expect(a.timestamp, DateTime(2023, 11, 25));
  });

  test("12 Optional Parameters", () {
    var b = B(val: "5");

    expect(b.optional, null);
  });

  test("13 Constant Constructor", () {
    var b = B(val: "5");

    expect(b.optional, null);
  });

  test("14 Generate JSOn", () {
    var flossy = Pet(name: "Flossy", age: 5);
    var json = flossy.toJson_2({});

    expect(json, {'name': 'Flossy', 'age': 5, '_className_': 'Pet'});
  });

  test("15 Convert JSON to an Object", () {
    var json = {'name': 'Flossy', 'age': 5, '_className_': 'Pet'};

    var flossyFromJson = Pet.fromJson(json);
    var flossy = Pet(name: "Flossy", age: 5);

    expect(flossyFromJson == flossy, true);
  });

  test("16 Json polymorphism", () {
    var toJsonAs = [
      X(val: "x"),
      Y(val: "xy", valY: 1),
      Z(val: "xyz", valY: 2, valZ: 4.34),
    ];

    var result = toJsonAs.map((e) => e.toJson_2({})).toList();

    var resultJson = [
      {'val': 'x', '_className_': 'X'},
      {'val': 'xy', 'valY': 1, '_className_': 'Y'},
      {'val': 'xyz', 'valY': 2, 'valZ': 4.34, '_className_': 'Z'}
    ];

    expect(result, resultJson);

    var resultObjects = resultJson.map((e) => X.fromJson(e)).toList();

    expect(resultObjects, toJsonAs);
  });
}
