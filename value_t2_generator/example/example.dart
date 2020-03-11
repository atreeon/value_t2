//see example project in github for more examples
import 'package:meta/meta.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'example.g.dart';

//THE SIMPLEST OF EXAMPLES

@ValueT2()
abstract class $Pet {
  String get type;
}
