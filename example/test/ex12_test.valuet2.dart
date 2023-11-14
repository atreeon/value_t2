// ignore_for_file: UNNECESSARY_CAST

part of 'ex12_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
abstract class A<Ta, Tb> extends $$A<Ta, Tb> {
  Ta get x;
  Tb get y;
  A cwA<Ta, Tb>({
    Opt<Ta>? x,
    Opt<Tb>? y,
  });
}

extension $$A_copyTo_E on $$A {}

enum A$ { x, y }

//x()
///
///implements [$$A]
///

///
class B<Ta, Tb> extends $B<Ta, Tb> implements A<Ta, Tb> {
  final Ta x;
  final Tb y;
  final String z;

  ///
  ///implements [$$A]
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
  B cwA<Ta, Tb>({
    Opt<Ta>? x,
    Opt<Tb>? y,
  }) {
    return B(
      x: x == null ? this.x as Ta : x.value as Ta,
      y: y == null ? this.y as Tb : y.value as Tb,
      z: (this as B).z,
    );
  }

  B cwB<Ta, Tb>({
    Opt<Ta>? x,
    Opt<Tb>? y,
    Opt<String>? z,
  }) {
    return B(
      x: x == null ? this.x as Ta : x.value as Ta,
      y: y == null ? this.y as Tb : y.value as Tb,
      z: z == null ? this.z as String : z.value as String,
    );
  }
}

extension $B_copyTo_E on $B {}

enum B$ { x, y, z }
