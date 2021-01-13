import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex17.g.dart';

///BatchLesson does xyz
@ValueT2()
abstract class $$Batch_Lesson {}

///Lesson Lectures does blah
///something else
@ValueT2()
abstract class $$Lesson_Lectures implements $$Batch_Lesson {}

///StagedLesson does h
@ValueT2()
abstract class $$Batch_Staged_Lesson implements $$Batch_Lesson {}

///This is my actual class
@ValueT2()
abstract class $Batch_Staged_Lesson_Lectures implements $$Batch_Staged_Lesson, $$Lesson_Lectures {}

main() {
  Batch_Staged_Lesson_Lectures blah = Batch_Staged_Lesson_Lectures();
  print(blah.toString());
}
