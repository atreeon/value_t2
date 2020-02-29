import 'package:value_t2_annotation/value_t2_annotation.dart';

//see example project in github

@ValueT2()
class Person {
  final int age;
  final String name;

  Person({this.age, this.name});

  String toString() => "${age.toString()}, ${name.toString()}";
}
