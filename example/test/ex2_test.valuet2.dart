// ignore_for_file: UNNECESSARY_CAST

part of 'ex2_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
abstract class A<T> extends $$A<T> {
  T get x;
  A cwA<T>({
    Opt<T>? x,
  });
}

extension $$A_copyTo_E on $$A {}

enum A$ { x }

//x()
///
///implements [$$A]
///

///
///implements [$C]
///

///
class B<T extends $C, T3> extends $B<T, T3> implements A<int>, C {
  final int x;

  ///Blah
  final T y;
  final String z;

  ///
  ///implements [$$A]
  ///

  ///
  ///implements [$C]
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
  B cwA<T>({
    Opt<T>? x,
  }) {
    return B(
      x: x == null ? this.x as int : x.value as int,
      y: (this as B).y,
      z: (this as B).z,
    );
  }

  B cwC({
    Opt<String>? z,
  }) {
    return B(
      z: z == null ? this.z as String : z.value as String,
      x: (this as B).x,
      y: (this as B).y,
    );
  }

  B cwB<T extends $C, T3>({
    Opt<int>? x,
    Opt<T>? y,
    Opt<String>? z,
  }) {
    return B(
      x: x == null ? this.x as int : x.value as int,
      y: y == null ? this.y as T : y.value as T,
      z: z == null ? this.z as String : z.value as String,
    );
  }
}

extension $B_copyTo_E on $B {}

enum B$ { x, y, z }

//x()
///
class C extends $C {
  final String z;

  ///
  C({
    required this.z,
  });
  String toString() => "(C-z:${z.toString()})";
  int get hashCode => hashObjects([z.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is C && runtimeType == other.runtimeType && z == other.z;
  C cwC({
    Opt<String>? z,
  }) {
    return C(
      z: z == null ? this.z as String : z.value as String,
    );
  }
}

extension $C_copyTo_E on $C {}

enum C$ { z }
