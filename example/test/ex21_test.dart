import 'package:meta/meta.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

//you don't get copywith
//you don't get copyfrom

part 'ex21_test.g.dart';

@ValueT2()
abstract class $$Batch {}

@ValueT2()
abstract class $$BatchItem {
  List<int> get lectureIds;
}

@ValueT2()
abstract class $$BatchSome<TBatchItem extends $$BatchItem> implements $$Batch {
  List<TBatchItem> get batchItems;
}

@ValueT2()
abstract class $Batch_Staged_Worsts_Lectures
    implements //
        $$BatchSome<$BatchItemLectureWithType> {
  List<$BatchItemLectureWithType> get batchItems;
}

@ValueT2()
abstract class $BatchItemLectureWithType implements $$BatchItem {
  bool get isComplete;
}

main() {
  test("1", () {
    var batch = Batch_Staged_Worsts_Lectures(batchItems: <$BatchItemLectureWithType>[]);
    expect(batch is BatchSome<$BatchItemLectureWithType>, true);
  });
}
