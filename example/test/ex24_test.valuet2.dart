// ignore_for_file: UNNECESSARY_CAST

part of 'ex24_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///A LIST THAT IS OF A GENERATED GENERIC TYPE
///
class ScheduleVM extends $ScheduleVM {
  final List<ScheduleVM_Item> schedules;

  ///A LIST THAT IS OF A GENERATED GENERIC TYPE
  ///
  ScheduleVM({
    required this.schedules,
  });
  String toString() => "(ScheduleVM-schedules:${schedules.toString()})";
  int get hashCode => hashObjects([schedules.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleVM &&
          runtimeType == other.runtimeType &&
          (schedules).equalUnorderedD(other.schedules);
  ScheduleVM cwScheduleVM({
    Opt<List<ScheduleVM_Item>>? schedules,
  }) {
    return ScheduleVM(
      schedules: schedules == null
          ? this.schedules as List<ScheduleVM_Item>
          : schedules.value as List<ScheduleVM_Item>,
    );
  }
}

extension $ScheduleVM_copyTo_E on $ScheduleVM {}

enum ScheduleVM$ { schedules }

//x()
///
class ScheduleVM_Item extends $ScheduleVM_Item {
  final String value;

  ///
  ScheduleVM_Item({
    required this.value,
  });
  String toString() => "(ScheduleVM_Item-value:${value.toString()})";
  int get hashCode => hashObjects([value.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleVM_Item &&
          runtimeType == other.runtimeType &&
          value == other.value;
  ScheduleVM_Item cwScheduleVM_Item({
    Opt<String>? value,
  }) {
    return ScheduleVM_Item(
      value: value == null ? this.value as String : value.value as String,
    );
  }
}

extension $ScheduleVM_Item_copyTo_E on $ScheduleVM_Item {}

enum ScheduleVM_Item$ { value }
