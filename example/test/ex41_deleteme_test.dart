import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex41_deleteme_test.valuet2.dart';

enum DatabaseResultFailureCode { unknown, non200ResponseCode }

@ValueT2()
abstract class $$DatabaseResultI<T> {}

@ValueT2()
abstract class $DatabaseResult_Success<T> implements $$DatabaseResultI<T> {
  T get data;
}

@ValueT2()
abstract class $DatabaseResult_Failure<T> implements $$DatabaseResultI<T> {
  DatabaseResultFailureCode get failureCode;
  String get description;
}

void main() {
  test("0 ", () {
    expect(true, true);
  });
}