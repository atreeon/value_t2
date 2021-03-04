import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex22_test.valuet2.dart';

//NULL FIELD NAMES - NULL SAFETY USING ?

@ValueT2()
abstract class $Pet {
  String? get type;
  String get name;
}

main() {
  test("1", () {
    var a = Pet(name: "mitzy");

    expect(a.name, "mitzy");
    expect(a.type, null);
  });
}
