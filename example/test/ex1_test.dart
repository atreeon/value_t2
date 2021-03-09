import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex1_test.valuet2.dart';

//THE SIMPLEST OF EXAMPLES

@valueT2
abstract class $Pet {
  String get type;
}

main() {
  test("1", () {
    var a = Pet(type: "cat");

    expect(a.type, "cat");
  });
}
