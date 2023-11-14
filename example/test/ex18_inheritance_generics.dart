import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex18_inheritance_generics.valuet2.dart';

//superclass
@valueT2
abstract class $A<T> {
  List<T> get batchItems;
}

//subclass of generic unrelated class X
@valueT2
abstract class $B implements $A<$X> {
  List<$X> get batchItems;
}

//unrelated class
@valueT2
abstract class $X {
  int get id;
}
