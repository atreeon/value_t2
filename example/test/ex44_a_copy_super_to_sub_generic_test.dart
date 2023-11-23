import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex44_a_copy_super_to_sub_generic_test.valuet2.dart';

@ValueT2(explicitSubTypes: [$Sub])
abstract class $Super {
  String get id;
}

@valueT2
abstract class $Sub<T> implements $Super {
  String get description;
  T get code;
}

main() {
  test("1", () {
    var _super = Super(id: "id");
    var result = _super.changeTo_Sub<int>(description: "description", code: 5);
    expect(result is Sub, true);
  });
}
