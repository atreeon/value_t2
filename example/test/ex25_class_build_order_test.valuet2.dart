// ignore_for_file: UNNECESSARY_CAST

part of 'ex25_class_build_order_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///EXPLICITLY BUILDING ONE BEFORE ANOTHER
///$ScheduleVM_Item should build before $ScheduleVM
///
class ScheduleVM<T extends ScheduleVM_Item> extends $ScheduleVM<T> {
  final List<T> schedules;

  ///EXPLICITLY BUILDING ONE BEFORE ANOTHER
  ///$ScheduleVM_Item should build before $ScheduleVM
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
  ScheduleVM cwScheduleVM<T extends ScheduleVM_Item>({
    Opt<List<T>>? schedules,
  }) {
    return ScheduleVM(
      schedules: schedules == null
          ? this.schedules as List<T>
          : schedules.value as List<T>,
    );
  }
}

extension $ScheduleVM_copyTo_E on $ScheduleVM {}

enum ScheduleVM$ { schedules }
