// ignore_for_file: UNNECESSARY_CAST

part of 'ex30_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
class A extends $A {
  final Person a;

  ///
  A({
    required this.a,
  });
  String toString() => "(A-a:${a.toString()})";
  int get hashCode => hashObjects([a.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A && runtimeType == other.runtimeType && a == other.a;
  A cwA({
    Opt<Person>? a,
  }) {
    return A(
      a: a == null ? this.a as Person : a.value as Person,
    );
  }
}

extension $A_copyTo_E on $A {}

enum A$ { a }

//x()
///
///implements [$A]
///

///
class B extends $B implements A {
  final Employee a;

  ///
  ///implements [$A]
  ///

  ///
  B({
    required this.a,
  });
  String toString() => "(B-a:${a.toString()})";
  int get hashCode => hashObjects([a.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is B && runtimeType == other.runtimeType && a == other.a;
  B cwA({
    Opt<Person>? a,
  }) {
    return B(
      a: a == null ? this.a as Employee : a.value as Employee,
    );
  }

  B cwB({
    Opt<Employee>? a,
  }) {
    return B(
      a: a == null ? this.a as Employee : a.value as Employee,
    );
  }
}

extension $B_copyTo_E on $B {}

enum B$ { a }
