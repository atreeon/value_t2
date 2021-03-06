import 'package:meta/meta.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex22_test.g.dart';

//NULL FIELD NAMES

@ValueT2(nullFieldNames: ["type"])
abstract class $Pet {
  String get type;
  String get name;
}

main() {
  test("1", () {
    var a = Pet(name: "mitzy");

    expect(a.name, "mitzy");
    expect(a.type, null);
  });
}
