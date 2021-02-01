import 'package:test/test.dart';

//THE SIMPLEST OF EXAMPLES

class Pet {
  final String type;
  Pet({required this.type});
}

main() {
  test("1", () {
    var a = Pet(type: "cat");

    expect(a.type, "cat");
  });
}
