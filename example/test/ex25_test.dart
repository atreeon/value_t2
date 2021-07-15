import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex25_test.valuet2.dart';
part 'ex25_test.valuet3.dart';

///EXPLICITLY BUILDING ONE BEFORE ANOTHER
///$ScheduleVM_Item should build before $ScheduleVM

@valueT2
abstract class $ScheduleVM<T extends ScheduleVM_Item> {
  List<T> get schedules;
}

@valueT3
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
