import 'package:meta/meta.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex20_test.g.dart';

main() {
  test("1", () {
    var batch = BS_BI(batchItems: List<BI>());
    var blah = BQR(batch: batch);

    expect(blah.batch.batchItems.length, 1);
  });
}

@ValueT2()
abstract class $BI {
  int orderId;
}

@ValueT2()
abstract class $BQR {
  $BS<$BI> batch;
}

@ValueT2()
abstract class $BS<Tbi extends $BI> {
  List<Tbi> batchItems;
}

@ValueT2()
abstract class $BS_BI implements $BS<$BI> {
  List<$BI> batchItems;
}
