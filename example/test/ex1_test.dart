import 'package:meta/meta.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex1_test.g.dart';

//THE SIMPLEST OF EXAMPLES

@ValueT2()
abstract class $Pet {
  String get type;
}

main() {
  test("1", () {
    var a = Pet(type: "cat");

    expect(a.type, "cat");
  });
}
