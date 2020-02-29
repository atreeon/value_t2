import 'package:copy_with_e_annotation/copy_with_e_annotation.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

part 'ex1_manual_test.g.dart';
part 'ex1_manual_test.valueT2.dart';

abstract class $Pet {
  String get type;
  String get name;
}

main() {
  test("1", () {
    var a = Pet(type: "cat", name: "boris");

    expect(a.type, "cat");
  });
}
