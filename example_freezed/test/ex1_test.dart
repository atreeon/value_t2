import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test/test.dart';

part 'ex1_test.freezed.dart';

//THE SIMPLEST OF EXAMPLES

@freezed
abstract class Pet with _$Pet {
  const factory Pet({
    required String type,
  }) = _Pet;
}

main() {
  test("1", () {
    var a = Pet(type: "cat");

    expect(a.type, "cat");
  });
}
