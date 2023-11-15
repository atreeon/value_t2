import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex45_copyWithPolymorphic_test.valuet2.dart';

/// ChangeTo_ function is used to change the underlying type from one to another
/// To enable ChangeTo on a class we need to add the type to the list of explicitSubTypes in the annotation

/// To copy from a super class to a sub we will always change the underlining type.
/// Therefore we will always use changeTo_

/// A reminder that copyWith always retains the original type
/// even though it can be used polymorphically; ie on super and sub classes.

// ignore_for_file: unqualified_reference_to_non_local_static_member

@ValueT2([$Sub])
abstract class $Super {
  String get id;
}

@valueT2
abstract class $Sub implements $Super {
  String get description;
}

main() {
  group("", () {
    test("1a", () {
      var supers = <Super>[
        Super(id: "id"),
        Sub(id: "id", description: "description"),
      ];

      //copyWith_Super called on both Super & Sub objects
      var result = supers.map((e) => //
          e.copyWith_Super(id: Opt(e.id + "_"))).toList();

      //they both retain their original type
      expect(result[0] is Sub, false);
      expect(result[0] is Super, true);

      expect(result[1] is Sub, true);
      expect(result[1] is Super, true);
    });
  });
}
