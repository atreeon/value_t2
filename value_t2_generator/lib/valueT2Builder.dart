import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';
import 'package:value_t2_generator/src/ValueT2Generator.dart';

Builder valueT2Builder(BuilderOptions options) => //
    PartBuilder([ValueT2Generator<ValueT2>()], '.valuet2.dart',
        header: '''
// ignore_for_file: UNNECESSARY_CAST
    ''');
