// ignore_for_file: UNNECESSARY_CAST

part of 'ex36_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x($B)
///
class A extends $A {
  final String x;

  ///
  A({
    required this.x,
  });
  String toString() => "(A-x:${x.toString()})";
  int get hashCode => hashObjects([x.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A && runtimeType == other.runtimeType && x == other.x;
  A cwA({
    Opt<String>? x,
  }) {
    return A(
      x: x == null ? this.x as String : x.value as String,
    );
  }
}

extension $A_copyTo_E on $A {
  B copyToB({
    required String y,
    Opt<String>? x,
  }) {
    return B(
      y: y as String,
      x: x == null ? this.x as String : x.value as String,
    );
  }
}

enum A$ { x }

//x()
///
///implements [$A]
///

///
class B extends $B implements A {
  final String x;
  final String y;

  ///
  ///implements [$A]
  ///

  ///
  B({
    required this.x,
    required this.y,
  });
  String toString() => "(B-x:${x.toString()}|y:${y.toString()})";
  int get hashCode => hashObjects([x.hashCode, y.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is B &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;
  B cwA({
    Opt<String>? x,
  }) {
    return B(
      x: x == null ? this.x as String : x.value as String,
      y: (this as B).y,
    );
  }

  B cwB({
    Opt<String>? x,
    Opt<String>? y,
  }) {
    return B(
      x: x == null ? this.x as String : x.value as String,
      y: y == null ? this.y as String : y.value as String,
    );
  }
}

extension $B_copyTo_E on $B {}

enum B$ { x, y }
