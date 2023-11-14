// ignore_for_file: UNNECESSARY_CAST

part of 'ex32_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
class A extends $A {
  final A? a;
  final int b;

  ///
  A({
    this.a,
    required this.b,
  });
  const A.constant({
    this.a,
    required this.b,
  });
  String toString() => "(A-a:${a.toString()}|b:${b.toString()})";
  int get hashCode => hashObjects([a.hashCode, b.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b;
  A cwA({
    Opt<A?>? a,
    Opt<int>? b,
  }) {
    return A(
      a: a == null ? this.a as A? : a.value as A?,
      b: b == null ? this.b as int : b.value as int,
    );
  }
}

extension $A_copyTo_E on $A {}

enum A$ { a, b }
