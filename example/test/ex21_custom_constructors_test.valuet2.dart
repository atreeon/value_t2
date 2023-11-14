// ignore_for_file: UNNECESSARY_CAST

part of 'ex21_custom_constructors_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
class A_ extends $A_ {
  final String a;

  ///
  A_._({
    required this.a,
  });
  String toString() => "(A_-a:${a.toString()})";
  int get hashCode => hashObjects([a.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A_ && runtimeType == other.runtimeType && a == other.a;
  A_ cwA_({
    Opt<String>? a,
  }) {
    return A_._(
      a: a == null ? this.a as String : a.value as String,
    );
  }
}

extension $A__copyTo_E on $A_ {}

enum A_$ { a }
