import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex28_test.valuet2.dart';

///FIELD LIST ENUM

@valueT2
abstract class $Pet {
  String? get type;
  String get name;
}

main() {
  test("1", () {
    expect(Pet$.type.toString(), 'Pet\$.type');
    expect(Pet$.type.toString(), 'Pet\$.type');
  });
}
