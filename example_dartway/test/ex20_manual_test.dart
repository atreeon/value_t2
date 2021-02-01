//import 'package:test/test.dart';
//
//main() {
////  var batch = BS_BI();
////  var blah = BQR(batch);
//
//  test("1", () {});
//}
//
//abstract class $BI {
//  int orderId;
//}
//
//abstract class BI extends $BI {
//  int orderId;
//}
//
//abstract class $BQR {
//  $BS<$BI> batch;
//}
//
//class BQR extends $BQR {
//  final BS<$BI> batch; // was final BS<BI> batch; (kept the dollar)
//  BQR(this.batch);
//}
//
//abstract class $BS<Tbi extends $BI> {
//  List<Tbi> batchItems;
//}
//
//abstract class BS<Tbi extends $BI> extends $BS<Tbi> {
//  List<Tbi> batchItems;
//}
//
//abstract class $BS_BI implements $BS<$BI> {
//  List<$BI> batchItems;
//}
//
//class BS_BI extends $BS_BI implements BS<$BI> {
//  final List<BI> batchItems;
//  BS_BI({
//    this.batchItems,
//  });
//}
////****gen
