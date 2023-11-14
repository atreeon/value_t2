// ignore_for_file: UNNECESSARY_CAST

part of 'ex29_copywith_subclasses_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///Copywith from subclass to superclass & superclass to subclass
///
abstract class A extends $$A {
  String get a;
  A cwA({
    Opt<String>? a,
  });
}

extension $$A_copyTo_E on $$A {}

enum A$ { a }

//x()
///
///implements [$$A]
///

///Copywith from subclass to superclass & superclass to subclass
///
class B<T1> extends $B<T1> implements A {
  final String a;
  final T1 b;

  ///
  ///implements [$$A]
  ///

  ///Copywith from subclass to superclass & superclass to subclass
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

  B cwB<T1>({
    Opt<String>? a,
    Opt<T1>? b,
  }) {
    return B(
      a: a == null ? this.a as String : a.value as String,
      b: b == null ? this.b as T1 : b.value as T1,
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
class C<T1> extends $C<T1> implements B<T1> {
  final String a;
  final T1 b;
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
  C cwB<T1>({
    Opt<String>? a,
    Opt<T1>? b,
  }) {
    return C(
      a: a == null ? this.a as String : a.value as String,
      b: b == null ? this.b as T1 : b.value as T1,
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

  C cwC<T1>({
    Opt<String>? a,
    Opt<T1>? b,
    Opt<bool>? c,
  }) {
    return C(
      a: a == null ? this.a as String : a.value as String,
      b: b == null ? this.b as T1 : b.value as T1,
      c: c == null ? this.c as bool : c.value as bool,
    );
  }
}

extension $C_copyTo_E on $C {}

enum C$ { a, b, c }

//x()
///
///implements [$B]
///

///
class D<T1> extends $D<T1> implements B<T1> {
  final String a;
  final T1 b;

  ///
  ///implements [$B]
  ///

  ///
  D({
    required this.a,
    required this.b,
  });
  String toString() => "(D-a:${a.toString()}|b:${b.toString()})";
  int get hashCode => hashObjects([a.hashCode, b.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is D &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b;
  D cwB<T1>({
    Opt<String>? a,
    Opt<T1>? b,
  }) {
    return D(
      a: a == null ? this.a as String : a.value as String,
      b: b == null ? this.b as T1 : b.value as T1,
    );
  }

  D cwA({
    Opt<String>? a,
  }) {
    return D(
      a: a == null ? this.a as String : a.value as String,
      b: (this as D).b,
    );
  }

  D cwD<T1>({
    Opt<String>? a,
    Opt<T1>? b,
  }) {
    return D(
      a: a == null ? this.a as String : a.value as String,
      b: b == null ? this.b as T1 : b.value as T1,
    );
  }
}

extension $D_copyTo_E on $D {}

enum D$ { a, b }

//x()
///
abstract class X extends $$X {
  X cwX();
}

extension $$X_copyTo_E on $$X {}

//x()
///
///implements [$$X]
///

///
class Y extends $Y implements X {
  final String a;

  ///
  ///implements [$$X]
  ///

  ///
  Y({
    required this.a,
  });
  String toString() => "(Y-a:${a.toString()})";
  int get hashCode => hashObjects([a.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Y && runtimeType == other.runtimeType && a == other.a;
  Y cwX() {
    return Y(
      a: (this as Y).a,
    );
  }

  Y cwY({
    Opt<String>? a,
  }) {
    return Y(
      a: a == null ? this.a as String : a.value as String,
    );
  }
}

extension $Y_copyTo_E on $Y {}

enum Y$ { a }
