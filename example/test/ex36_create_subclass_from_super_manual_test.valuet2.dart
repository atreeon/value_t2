// ignore_for_file: UNNECESSARY_CAST

part of 'ex36_create_subclass_from_super_manual_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
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

extension $A_copyTo_E on $A {}

enum A$ { x }

//x()
///
///implements [$A]
///

///
class B extends $B implements A {
  final String x;
  final String y;
  final C z;

  ///
  ///implements [$A]
  ///

  ///
  B({
    required this.x,
    required this.y,
    required this.z,
  });
  String toString() =>
      "(B-x:${x.toString()}|y:${y.toString()}|z:${z.toString()})";
  int get hashCode => hashObjects([x.hashCode, y.hashCode, z.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is B &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y &&
          z == other.z;
  B cwA({
    Opt<String>? x,
  }) {
    return B(
      x: x == null ? this.x as String : x.value as String,
      y: (this as B).y,
      z: (this as B).z,
    );
  }

  B cwB({
    Opt<String>? x,
    Opt<String>? y,
    Opt<C>? z,
  }) {
    return B(
      x: x == null ? this.x as String : x.value as String,
      y: y == null ? this.y as String : y.value as String,
      z: z == null ? this.z as C : z.value as C,
    );
  }
}

extension $B_copyTo_E on $B {}

enum B$ { x, y, z }

//x()
///
class C extends $C {
  final String v;

  ///
  C({
    required this.v,
  });
  String toString() => "(C-v:${v.toString()})";
  int get hashCode => hashObjects([v.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is C && runtimeType == other.runtimeType && v == other.v;
  C cwC({
    Opt<String>? v,
  }) {
    return C(
      v: v == null ? this.v as String : v.value as String,
    );
  }
}

extension $C_copyTo_E on $C {}

enum C$ { v }
