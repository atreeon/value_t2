import 'package:quiver_hashcode/hashcode.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex18.valuet2.dart';

@ValueT2()
abstract class $B implements $A<$C> {
  List<$C> get batchItems;
}

@ValueT2()
abstract class $A<T> {
  List<T> get batchItems;
}

@ValueT2()
abstract class $C {
  int get id;
}
