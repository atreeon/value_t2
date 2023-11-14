// ignore_for_file: UNNECESSARY_CAST

part of 'ex36_create_subclass_from_super_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x($B)
/// Use .copyToX to create a subclass from a superclass
/// todo: whats the difference between copyToX & cwX
///
class A extends $A {
  final String x;

  /// Use .copyToX to create a subclass from a superclass
  /// todo: whats the difference between copyToX & cwX
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

/// Use .copyToX to create a subclass from a superclass
/// todo: whats the difference between copyToX & cwX
///
class B extends $B implements A {
  final String x;
  final String y;

  ///
  ///implements [$A]
  ///

  /// Use .copyToX to create a subclass from a superclass
  /// todo: whats the difference between copyToX & cwX
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
