// ignore_for_file: UNNECESSARY_CAST

part of 'ex31_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
class A extends $A {
  final int a;

  ///
  A({
    required this.a,
  });
  const A.constant({
    required this.a,
  });
  String toString() => "(A-a:${a.toString()})";
  int get hashCode => hashObjects([a.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A && runtimeType == other.runtimeType && a == other.a;
  A cwA({
    Opt<int>? a,
  }) {
    return A(
      a: a == null ? this.a as int : a.value as int,
    );
  }
}

extension $A_copyTo_E on $A {}

enum A$ { a }
