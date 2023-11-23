// ignore_for_file: unnecessary_cast

import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex46_json_test.g.dart';
part 'ex46_json_test.valuet2.dart';

main() {
  test("1 toJson", () {
    var a = Pet(kind: "cat");

    expect(a.toJson(), {'kind': 'cat', '_className_': 'Pet'});
  });

  test("2 fromJson", () {
    var a = Pet.fromJson({'kind': 'cat', '_className_': 'Pet'});

    expect(a.toString(), '(Pet-kind:cat)');
  });
}

@ValueT2(generateJson: true)
abstract class $Pet {
  String get kind;
}
