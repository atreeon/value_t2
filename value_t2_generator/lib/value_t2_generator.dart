import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t2_generator/src/ValueT2Generator.dart';

Builder valueT2Builder(BuilderOptions options) => //
    PartBuilder([ValueT2Generator()], '.valuet2.dart',
        header: '''
// ignore_for_file: UNNECESSARY_CAST
    ''');

//Builder valueT2Builder(BuilderOptions options) => //
//    SharedPartBuilder(
//      [
//        ValueT2Generator(),
//      ],
//      'value_t2_',
//    );
