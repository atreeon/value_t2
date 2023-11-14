// ignore_for_file: UNNECESSARY_CAST

part of 'ex37_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
abstract class Super extends $$Super {
  String get x;
  Super cwSuper({
    Opt<String>? x,
  });
}

extension $$Super_copyTo_E on $$Super {}

enum Super$ { x }

//x($SubB)
///
///implements [$$Super]
///

///
class SubA extends $SubA implements Super {
  final String x;

  ///
  ///implements [$$Super]
  ///

  ///
  SubA({
    required this.x,
  });
  String toString() => "(SubA-x:${x.toString()})";
  int get hashCode => hashObjects([x.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubA && runtimeType == other.runtimeType && x == other.x;
  SubA cwSuper({
    Opt<String>? x,
  }) {
    return SubA(
      x: x == null ? this.x as String : x.value as String,
    );
  }

  SubA cwSubA({
    Opt<String>? x,
  }) {
    return SubA(
      x: x == null ? this.x as String : x.value as String,
    );
  }
}

extension $SubA_copyTo_E on $SubA {
  SubB copyToSubB({
    required String z,
    Opt<String>? x,
  }) {
    return SubB(
      z: z as String,
      x: x == null ? this.x as String : x.value as String,
    );
  }
}

enum SubA$ { x }

//x()
///
///implements [$$Super]
///

///
class SubB extends $SubB implements Super {
  final String z;
  final String x;

  ///
  ///implements [$$Super]
  ///

  ///
  SubB({
    required this.z,
    required this.x,
  });
  String toString() => "(SubB-z:${z.toString()}|x:${x.toString()})";
  int get hashCode => hashObjects([z.hashCode, x.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubB &&
          runtimeType == other.runtimeType &&
          z == other.z &&
          x == other.x;
  SubB cwSuper({
    Opt<String>? x,
  }) {
    return SubB(
      x: x == null ? this.x as String : x.value as String,
      z: (this as SubB).z,
    );
  }

  SubB cwSubB({
    Opt<String>? z,
    Opt<String>? x,
  }) {
    return SubB(
      z: z == null ? this.z as String : z.value as String,
      x: x == null ? this.x as String : x.value as String,
    );
  }
}

extension $SubB_copyTo_E on $SubB {}

enum SubB$ { z, x }
