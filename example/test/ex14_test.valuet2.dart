// ignore_for_file: UNNECESSARY_CAST

part of 'ex14_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
class A extends $A {
  final String a;

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
    Opt<String>? a,
  }) {
    return A(
      a: a == null ? this.a as String : a.value as String,
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
  final String a;
  final int b;

  ///
  ///implements [$A]
  ///

  ///
  B({
    required this.a,
    required this.b,
  });
  String toString() => "(B-a:${a.toString()}|b:${b.toString()})";
  int get hashCode => hashObjects([a.hashCode, b.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is B &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b;
  B cwA({
    Opt<String>? a,
  }) {
    return B(
      a: a == null ? this.a as String : a.value as String,
      b: (this as B).b,
    );
  }

  B cwB({
    Opt<String>? a,
    Opt<int>? b,
  }) {
    return B(
      a: a == null ? this.a as String : a.value as String,
      b: b == null ? this.b as int : b.value as int,
    );
  }
}

extension $B_copyTo_E on $B {}

enum B$ { a, b }

//x()
///
///implements [$B]
///

///
class C extends $C implements B {
  final String a;
  final int b;
  final bool c;

  ///
  ///implements [$B]
  ///

  ///
  C({
    required this.a,
    required this.b,
    required this.c,
  });
  String toString() =>
      "(C-a:${a.toString()}|b:${b.toString()}|c:${c.toString()})";
  int get hashCode => hashObjects([a.hashCode, b.hashCode, c.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is C &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b &&
          c == other.c;
  C cwB({
    Opt<String>? a,
    Opt<int>? b,
  }) {
    return C(
      a: a == null ? this.a as String : a.value as String,
      b: b == null ? this.b as int : b.value as int,
      c: (this as C).c,
    );
  }

  C cwA({
    Opt<String>? a,
  }) {
    return C(
      a: a == null ? this.a as String : a.value as String,
      b: (this as C).b,
      c: (this as C).c,
    );
  }

  C cwC({
    Opt<String>? a,
    Opt<int>? b,
    Opt<bool>? c,
  }) {
    return C(
      a: a == null ? this.a as String : a.value as String,
      b: b == null ? this.b as int : b.value as int,
      c: c == null ? this.c as bool : c.value as bool,
    );
  }
}

extension $C_copyTo_E on $C {}

enum C$ { a, b, c }