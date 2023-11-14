// ignore_for_file: UNNECESSARY_CAST

part of 'ex24_generics_fields_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///A LIST THAT IS OF A GENERATED GENERIC TYPE
///
class A extends $A {
  final List<X> xItems;

  ///A LIST THAT IS OF A GENERATED GENERIC TYPE
  ///
  A({
    required this.xItems,
  });
  String toString() => "(A-xItems:${xItems.toString()})";
  int get hashCode => hashObjects([xItems.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A &&
          runtimeType == other.runtimeType &&
          (xItems).equalUnorderedD(other.xItems);
  A cwA({
    Opt<List<X>>? xItems,
  }) {
    return A(
      xItems: xItems == null ? this.xItems as List<X> : xItems.value as List<X>,
    );
  }
}

extension $A_copyTo_E on $A {}

enum A$ { xItems }

//x()
///
class X extends $X {
  final String value;

  ///
  X({
    required this.value,
  });
  String toString() => "(X-value:${value.toString()})";
  int get hashCode => hashObjects([value.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is X && runtimeType == other.runtimeType && value == other.value;
  X cwX({
    Opt<String>? value,
  }) {
    return X(
      value: value == null ? this.value as String : value.value as String,
    );
  }
}

extension $X_copyTo_E on $X {}

enum X$ { value }
