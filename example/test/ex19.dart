import 'package:quiver_hashcode/hashcode.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex19.valuet2.dart';

@ValueT2()
abstract class $$A {}

@ValueT2()
abstract class $$B implements $$A {}

@ValueT2()
abstract class $$C<TBatchItem extends $$A> {
  List<TBatchItem> get items;
}

@ValueT2()
abstract class $$D {
  List<$$B> get items;
}

@ValueT2()
abstract class $E
    implements //
        $$C<$$B>,
        $$D {
  List<$$B> get items;
}
