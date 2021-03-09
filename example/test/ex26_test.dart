import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex26_test.valuet2.dart';

///HASHCODE KEEPS GETTING WRITTEN TO MY OUTPUT FOR NO REASON
///This isn't a recreation unfortunately but just a test to ensure any
///field claled hashcode is stripped out

@valueT2
abstract class $Blah {
  int get hashCode;
  int get id;
}

main() {
  test("1", () {
    var a = Blah(
      id: 5,
    );

    expect(a.id, 5);
  });
}
