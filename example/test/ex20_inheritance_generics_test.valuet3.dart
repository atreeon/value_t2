// ignore_for_file: UNNECESSARY_CAST

part of 'ex20_inheritance_generics_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT3>
// **************************************************************************

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
  BI copyWith_BI({
    Opt<int>? orderId,
  }) {
    return BI(
      orderId: orderId == null ? this.orderId as int : orderId.value as int,
    );
  }
}

extension $BI_changeTo_E on $BI {}

enum BI$ { orderId }
