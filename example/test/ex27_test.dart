import 'package:quiver_hashcode/hashcode.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex27_test.valuet2.dart';

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

main() {
  print('blah');
  print('x');
  print('blah');
  print('blah');
}
