import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex41_inheritance_generics.valuet2.dart';

enum eEnumExample { unknown, non200ResponseCode }

@ValueT2()
abstract class $$A<T> {}

//sibling of C, subclass of A, with a generic property of type A
@ValueT2()
abstract class $B<T> implements $$A<T> {
  T get data;
}

//sibling of B, subclass of A
@ValueT2()
abstract class $C<T> implements $$A<T> {
  eEnumExample get failureCode;

  String get description;
}
