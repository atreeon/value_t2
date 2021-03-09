import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex20_test.valuet2.dart';
part 'ex20_test.valuet3.dart';

///A GENERATED FILE SPECIFYING A GENERATED TYPE
//class $BS_BI implements $BS<BI> (BI is generated)

main() {
  test("1", () {
    var batch = BS_BI(batchItems: [BI(orderId: 456)]);

    var blah = BQR(batch: batch);
    expect(blah.batch.batchItems.length, 1);

    var result = batch.batchItems.map((e) => getOrderId(e)).toList();
    expect(result[0], 456);
  });
}

int getOrderId(BI bi) {
  return bi.orderId;
}

@valueT3
abstract class $BI {
  int get orderId;
}

@valueT2
abstract class $BQR {
  $BS<BI> get batch;
}

@valueT2
abstract class $BS<Tbi extends BI> {
  List<Tbi> get batchItems;
}

@valueT2
abstract class $BS_BI implements $BS<BI> {
  List<BI> get batchItems;
}
