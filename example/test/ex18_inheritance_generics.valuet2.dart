// ignore_for_file: UNNECESSARY_CAST

part of 'ex18_inheritance_generics.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
class A<T> extends $A<T> {
  final List<T> batchItems;

  ///
  A({
    required this.batchItems,
  });
  String toString() => "(A-batchItems:${batchItems.toString()})";
  int get hashCode => hashObjects([batchItems.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A &&
          runtimeType == other.runtimeType &&
          (batchItems).equalUnorderedD(other.batchItems);
  A copyWith_A<T>({
    Opt<List<T>>? batchItems,
  }) {
    return A(
      batchItems: batchItems == null
          ? this.batchItems as List<T>
          : batchItems.value as List<T>,
    );
  }
}

extension $A_changeTo_E on $A {}

enum A$ { batchItems }

//x()
///
///implements [$A]
///

///
class B extends $B implements A<$X> {
  final List<X> batchItems;

  ///
  ///implements [$A]
  ///

  ///
  B({
    required this.batchItems,
  });
  String toString() => "(B-batchItems:${batchItems.toString()})";
  int get hashCode => hashObjects([batchItems.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is B &&
          runtimeType == other.runtimeType &&
          (batchItems).equalUnorderedD(other.batchItems);
  B copyWith_A<T>({
    Opt<List<T>>? batchItems,
  }) {
    return B(
      batchItems: batchItems == null
          ? this.batchItems as List<X>
          : batchItems.value as List<X>,
    );
  }

  B copyWith_B({
    Opt<List<X>>? batchItems,
  }) {
    return B(
      batchItems: batchItems == null
          ? this.batchItems as List<X>
          : batchItems.value as List<X>,
    );
  }
}

extension $B_changeTo_E on $B {}

enum B$ { batchItems }

//x()
///
class X extends $X {
  final int id;

  ///
  X({
    required this.id,
  });
  String toString() => "(X-id:${id.toString()})";
  int get hashCode => hashObjects([id.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is X && runtimeType == other.runtimeType && id == other.id;
  X copyWith_X({
    Opt<int>? id,
  }) {
    return X(
      id: id == null ? this.id as int : id.value as int,
    );
  }
}

extension $X_changeTo_E on $X {}

enum X$ { id }
