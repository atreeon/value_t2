// ignore_for_file: UNNECESSARY_CAST

part of 'ex19_inheritance_generics.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
abstract class A extends $$A {
  A cwA();
}

extension $$A_copyTo_E on $$A {}

//x()
///
///implements [$$A]
///

///
abstract class B extends $$B implements A {
  B cwA();
  B cwB();
}

extension $$B_copyTo_E on $$B {}

//x()
///
abstract class C<TBatchItem extends $$A> extends $$C<TBatchItem> {
  List<TBatchItem> get items;
  C cwC<TBatchItem extends $$A>({
    Opt<List<TBatchItem>>? items,
  });
}

extension $$C_copyTo_E on $$C {}

enum C$ { items }

//x()
///
abstract class D extends $$D {
  List<B> get items;
  D cwD({
    Opt<List<B>>? items,
  });
}

extension $$D_copyTo_E on $$D {}

enum D$ { items }

//x()
///
///implements [$$C]
///

///
///implements [$$D]
///

///
class E extends $E implements C<$$B>, D {
  final List<B> items;

  ///
  ///implements [$$C]
  ///

  ///
  ///implements [$$D]
  ///

  ///
  E({
    required this.items,
  });
  String toString() => "(E-items:${items.toString()})";
  int get hashCode => hashObjects([items.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is E &&
          runtimeType == other.runtimeType &&
          (items).equalUnorderedD(other.items);
  E cwC<TBatchItem extends $$A>({
    Opt<List<TBatchItem>>? items,
  }) {
    return E(
      items: items == null ? this.items as List<B> : items.value as List<B>,
    );
  }

  E cwD({
    Opt<List<B>>? items,
  }) {
    return E(
      items: items == null ? this.items as List<B> : items.value as List<B>,
    );
  }

  E cwE({
    Opt<List<B>>? items,
  }) {
    return E(
      items: items == null ? this.items as List<B> : items.value as List<B>,
    );
  }
}

extension $E_copyTo_E on $E {}

enum E$ { items }
