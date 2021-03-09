import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex24_test.valuet2.dart';

///A LIST THAT IS OF A GENERATED GENERIC TYPE

@ValueT2()
abstract class $ScheduleVM {
  List<$ScheduleVM_Item> get schedules;
}

@ValueT2()
abstract class $ScheduleVM_Item {
  String get value;
}

main() {
  test("1", () {
    var a = ScheduleVM(
      schedules: [ScheduleVM_Item(value: "value")],
    );

    var result = a.schedules.map((e) => getItemValue(e)).toList();

    expect(result[0], "value");
  });
}

String getItemValue(ScheduleVM_Item item) {
  return item.value;
}
