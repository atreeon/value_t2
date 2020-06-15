import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex17.g.dart';

@ValueT2()
abstract class $$Batch_Lesson {}

@ValueT2()
abstract class $$Lesson_Lectures implements $$Batch_Lesson {}

@ValueT2()
abstract class $$Batch_Staged_Lesson implements $$Batch_Lesson {}

@ValueT2()
abstract class $Batch_Staged_Lesson_Lectures implements $$Batch_Staged_Lesson, $$Lesson_Lectures {}
