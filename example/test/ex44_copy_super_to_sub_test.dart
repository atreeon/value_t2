import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex44_copy_super_to_sub_test.valuet2.dart';

/// ChangeTo_ function is used to change the underlying type from one to another
/// To enable ChangeTo on a class we need to add the type to the list of explicitSubTypes in the annotation

/// To copy from a super class to a sub we will always change the underlining type.
/// Therefore we will always use changeTo_

/// A reminder that copyWith always retains the original type
/// even though it can be used polymorphically; ie on super and sub classes.

@ValueT2(explicitSubTypes: [$Sub])
abstract class $Super {
  String get id;
}

@valueT2
abstract class $Sub implements $Super {
  String get description;
}

main() {
  test("1", () {
    var _super = Super(id: "id");
    var result = _super.changeTo_Sub(description: "description");
    expect(result is Sub, true);
  });
}
