import 'package:meta/meta.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex23_test.g.dart';

//DEFAULT VALUES

@ValueT2()
abstract class $PairGroup {
  $$Selected get selected => const SelectedNone();
}

@ValueT2()
abstract class $$Selected {}

@ValueT2()
abstract class $SelectedNone implements $$Selected {
  const $SelectedNone();
}

@ValueT2()
abstract class $SelectedId implements $$Selected {
  int get id;
}

main() {
  test("1", () {
    var result = PairGroup();

    expect(result.selected is SelectedNone, true);
  });
}
