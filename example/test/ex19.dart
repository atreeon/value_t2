import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex19.valuet2.dart';

@valueT2
abstract class $$A {}

@valueT2
abstract class $$B implements $$A {}

@valueT2
abstract class $$C<TBatchItem extends $$A> {
  List<TBatchItem> get items;
}

@valueT2
abstract class $$D {
  List<$$B> get items;
}

@valueT2
abstract class $E
    implements //
        $$C<$$B>,
        $$D {
  List<$$B> get items;
}
