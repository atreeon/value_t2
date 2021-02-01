import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex23_test.g.dart';

//TAKE COMMENTS FROM CLASS

///This is my class level comment
@ValueT2()
abstract class $Cat {
  ///Type is a thingy thing
  String get type;

  String get colour; //no comment
}

main() {
  test("1", () {
    var a = Cat(
      type: "cat",
      colour: "blue",
    );

    expect(a.type, "cat");
  });
}
