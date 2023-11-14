// ignore_for_file: UNNECESSARY_CAST

part of 'ex39_copyTo_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x($B)
///
abstract class Super extends $$Super {
  String get x;
  Super cwSuper({
    Opt<String>? x,
  });
}

extension $$Super_copyTo_E on $$Super {
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

enum Super$ { x }

//x()
///
///implements [$$Super]
///

///
class A extends $A implements Super {
  final String x;
  final String z;

  ///
  ///implements [$$Super]
  ///

  ///
  A({
    required this.x,
    required this.z,
  });
  String toString() => "(A-x:${x.toString()}|z:${z.toString()})";
  int get hashCode => hashObjects([x.hashCode, z.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          z == other.z;
  A cwSuper({
    Opt<String>? x,
  }) {
    return A(
      x: x == null ? this.x as String : x.value as String,
      z: (this as A).z,
    );
  }

  A cwA({
    Opt<String>? x,
    Opt<String>? z,
  }) {
    return A(
      x: x == null ? this.x as String : x.value as String,
      z: z == null ? this.z as String : z.value as String,
    );
  }
}

extension $A_copyTo_E on $A {}

enum A$ { x, z }

//x()
///
///implements [$$Super]
///

///
class B extends $B implements Super {
  final String x;
  final String y;

  ///
  ///implements [$$Super]
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
  B cwSuper({
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
