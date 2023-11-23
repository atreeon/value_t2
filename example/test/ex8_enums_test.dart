import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex8_enums_test.g.dart';
part 'ex8_enums_test.valuet2.dart';

//enums support

enum eBlim { one, another, andthis }

@ValueT2(generateJson: true)
abstract class $Pet {
  String get type;

  eBlim get blim;
}

main() {
  test("1", () {
    var a = Pet(type: "cat", blim: eBlim.one);

    expect(a.type, "cat");
  });

  test("1 toJson as A", () {
    var pet = Pet(type: "cat", blim: eBlim.one);

    var result = pet.toJson_2({});

    var expected = {'type': 'cat', 'blim': 'one', '_className_': 'Pet'};

    expect(result, expected);
  });

  test("2 fromJson as A", () {
    var json = {'type': 'cat', 'blim': 'one', '_className_': 'Pet'};

    var result = Pet.fromJson(json);

    var expected = Pet(type: "cat", blim: eBlim.one);

    expect(result, expected);
  });
}
