// ignore_for_file: UNNECESSARY_CAST

part of 'ex20_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT3>
// **************************************************************************

//x()
///
class BI extends $BI {
  final int orderId;

  ///
  BI({
    required this.orderId,
  });
  String toString() => "(BI-orderId:${orderId.toString()})";
  int get hashCode => hashObjects([orderId.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BI &&
          runtimeType == other.runtimeType &&
          orderId == other.orderId;
  BI cwBI({
    Opt<int>? orderId,
  }) {
    return BI(
      orderId: orderId == null ? this.orderId as int : orderId.value as int,
    );
  }
}

extension $BI_copyTo_E on $BI {}

enum BI$ { orderId }
