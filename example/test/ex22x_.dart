//import 'package:meta/meta.dart';
//import 'package:quiver_hashcode/hashcode.dart';
//import 'package:value_t2_annotation/value_t2_annotation.dart';
//
//part 'ex22x_.g.dart';
//
/////Used for the sounds & animations to be played when a user has made an answer
//enum LastMarking { correct, allCorrect, incorrect, none }
//
/////Used for the animations to be played when a user selects, answers / completes or deselects
//enum LastSelection { selected, deselected, noSelection }
//
//@ValueT2()
//abstract class $PairsVM_ {
//  $PairGroup_ get source;
//  $PairGroup_ get foreign;
//  LastMarking get lastMarking;
//  LastSelection get lastSelection;
//  $$Marking get marking;
//}
//
//@ValueT2()
//abstract class $PairGroup_ {
//  List<$$PairItem> get pairItems;
//  $$Selected get selected;
//}
//
//@ValueT2()
//abstract class $$PairItem {
//  int get id;
//  String get word;
//  bool get isCorrect; // => false;
//}
//
//@ValueT2()
//abstract class $$Selected {}
//
//@ValueT2()
//abstract class $$Marking {}
