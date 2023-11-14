import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex27_bug.valuet2.dart';

///HASHCODE ERROR AGAIN

@ValueT2()
abstract class $UserLectureInfoPopupVM {
  String get lectureId;
  bool get isExcluded;
}

@ValueT2()
abstract class $UserLectureInfoPopupVM_worstWords implements $UserLectureInfoPopupVM {
  String get worstWordDue;
  String get stageOfStages;
}
