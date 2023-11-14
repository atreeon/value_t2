// ignore_for_file: UNNECESSARY_CAST

part of 'ex34_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
class A extends $A {
  final String a;

  ///
  A({
    required this.a,
  });
  String toString() => "(A-a:${a.toString()})";
  int get hashCode => hashObjects([a.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A && runtimeType == other.runtimeType && a == other.a;
  A cwA({
    Opt<String>? a,
  }) {
    return A(
      a: a == null ? this.a as String : a.value as String,
    );
  }
}

extension $A_copyTo_E on $A {}

enum A$ { a }

//x()
///
class B extends $B {
  final List<int>? b;

  ///
  B({
    this.b,
  });
  String toString() => "(B-b:${b.toString()})";
  int get hashCode => hashObjects([b.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is B &&
          runtimeType == other.runtimeType &&
          (b ?? []).equalUnorderedD(other.b ?? []);
  B cwB({
    Opt<List<int>?>? b,
  }) {
    return B(
      b: b == null ? this.b as List<int>? : b.value as List<int>?,
    );
  }
}

extension $B_copyTo_E on $B {}

enum B$ { b }