// ignore_for_file: UNNECESSARY_CAST

part of 'ex17.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///BatchLesson does xyz
///
abstract class Batch_Lesson extends $$Batch_Lesson {
  Batch_Lesson cwBatch_Lesson();
}

extension $$Batch_Lesson_copyTo_E on $$Batch_Lesson {}

//x()
///Lesson Lectures does blah
///something else
///
///implements [$$Batch_Lesson]
///

///BatchLesson does xyz
///
abstract class Lesson_Lectures extends $$Lesson_Lectures
    implements Batch_Lesson {
  Lesson_Lectures cwBatch_Lesson();
  Lesson_Lectures cwLesson_Lectures();
}

extension $$Lesson_Lectures_copyTo_E on $$Lesson_Lectures {}

//x()
///StagedLesson does h
///
///implements [$$Batch_Lesson]
///

///BatchLesson does xyz
///
abstract class Batch_Staged_Lesson extends $$Batch_Staged_Lesson
    implements Batch_Lesson {
  Batch_Staged_Lesson cwBatch_Lesson();
  Batch_Staged_Lesson cwBatch_Staged_Lesson();
}

extension $$Batch_Staged_Lesson_copyTo_E on $$Batch_Staged_Lesson {}

//x()
///This is my actual class
///
///implements [$$Batch_Staged_Lesson]
///

///StagedLesson does h
///
///implements [$$Lesson_Lectures]
///

///Lesson Lectures does blah
///something else
///
class Batch_Staged_Lesson_Lectures extends $Batch_Staged_Lesson_Lectures
    implements Batch_Staged_Lesson, Lesson_Lectures {
  ///This is my actual class
  ///
  ///implements [$$Batch_Staged_Lesson]
  ///

  ///StagedLesson does h
  ///
  ///implements [$$Lesson_Lectures]
  ///

  ///Lesson Lectures does blah
  ///something else
  ///
  Batch_Staged_Lesson_Lectures();

  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Batch_Staged_Lesson_Lectures && runtimeType == other.runtimeType;
  Batch_Staged_Lesson_Lectures cwBatch_Staged_Lesson() {
    return Batch_Staged_Lesson_Lectures();
  }

  Batch_Staged_Lesson_Lectures cwBatch_Lesson() {
    return Batch_Staged_Lesson_Lectures();
  }

  Batch_Staged_Lesson_Lectures cwLesson_Lectures() {
    return Batch_Staged_Lesson_Lectures();
  }

  Batch_Staged_Lesson_Lectures cwBatch_Staged_Lesson_Lectures() {
    return Batch_Staged_Lesson_Lectures();
  }
}

extension $Batch_Staged_Lesson_Lectures_copyTo_E
    on $Batch_Staged_Lesson_Lectures {}
