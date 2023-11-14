// ignore_for_file: UNNECESSARY_CAST

part of 'ex18.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
///implements [$A]
///

///
class B extends $B implements A<$C> {
  final List<C> batchItems;

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
  B cwA<T>({
    Opt<List<T>>? batchItems,
  }) {
    return B(
      batchItems: batchItems == null
          ? this.batchItems as List<C>
          : batchItems.value as List<C>,
    );
  }

  B cwB({
    Opt<List<C>>? batchItems,
  }) {
    return B(
      batchItems: batchItems == null
          ? this.batchItems as List<C>
          : batchItems.value as List<C>,
    );
  }
}

extension $B_copyTo_E on $B {}

enum B$ { batchItems }

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
  A cwA<T>({
    Opt<List<T>>? batchItems,
  }) {
    return A(
      batchItems: batchItems == null
          ? this.batchItems as List<T>
          : batchItems.value as List<T>,
    );
  }
}

extension $A_copyTo_E on $A {}

enum A$ { batchItems }

//x()
///
class C extends $C {
  final int id;

  ///
  C({
    required this.id,
  });
  String toString() => "(C-id:${id.toString()})";
  int get hashCode => hashObjects([id.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is C && runtimeType == other.runtimeType && id == other.id;
  C cwC({
    Opt<int>? id,
  }) {
    return C(
      id: id == null ? this.id as int : id.value as int,
    );
  }
}

extension $C_copyTo_E on $C {}

enum C$ { id }
