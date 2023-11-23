// ignore_for_file: unnecessary_cast

import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex48_json_with_subtype_test.g.dart';
part 'ex48_json_with_subtype_test.valuet2.dart';

/// Every subtype needs to also implement toJson & fromJson

@ValueT2(generateJson: true) //, explicitSubTypes: [$B, $C])
abstract class $A {
  String get id;

  $X get x;

  List<$X> get xs;
}

// @ValueT2(generateJson: true)
// abstract class $B implements $A {}

@ValueT2(generateJson: true)
abstract class $X {
  List<int> get items;
}

main() {
  test("1 toJson", () {
    var a = A(
      id: "1",
      x: X(items: [1, 2, 3]),
      xs: [
        X(items: [1]),
        X(items: [2]),
      ],
    );

    expect(
      a.toJson(),
      {
        'id': '1',
        'x': {
          'items': [1, 2, 3],
          '_className_': 'X'
        },
        'xs': [
          {
            'items': [1],
            '_className_': 'X'
          },
          {
            'items': [2],
            '_className_': 'X'
          }
        ],
        '_className_': 'A'
      },
    );
  });
}
