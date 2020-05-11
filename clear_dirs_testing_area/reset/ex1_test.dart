import 'package:meta/meta.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex1_test.g.dart';

@ValueT2()
abstract class $Pet {
  String type;
}

void main() {
  test('1', () {
    var a = Pet(type: 'cat');

    expect(a.type, 'cat');
  });
}
