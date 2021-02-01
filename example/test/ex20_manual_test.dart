import 'package:test/test.dart';

main() {
//  var batch = BS_BI();
//  var blah = BQR(batch);

  test("1", () {});
}

abstract class $BI {
  int get orderId;
}

abstract class BI extends $BI {
  int get orderId;
}

abstract class $BQR {
  $BS<$BI> get batch;
}

class BQR extends $BQR {
  final BS<$BI> batch; // was final BS<BI> batch; (kept the dollar)
  BQR(this.batch);
}

abstract class $BS<Tbi extends $BI> {
  List<Tbi> get batchItems;
}

abstract class BS<Tbi extends $BI> extends $BS<Tbi> {
  List<Tbi> get batchItems;
}

abstract class $BS_BI implements $BS<$BI> {
  List<$BI> get batchItems;
}

class BS_BI extends $BS_BI implements BS<$BI> {
  final List<BI> batchItems;
  BS_BI({
    required this.batchItems,
  });
}
//****gen
