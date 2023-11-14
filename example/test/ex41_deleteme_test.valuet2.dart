// ignore_for_file: UNNECESSARY_CAST

part of 'ex41_deleteme_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///
abstract class DatabaseResultI<T> extends $$DatabaseResultI<T> {
  DatabaseResultI cwDatabaseResultI<T>();
}

extension $$DatabaseResultI_copyTo_E on $$DatabaseResultI {}

//x()
///
///implements [$$DatabaseResultI]
///

///
class DatabaseResult_Success<T> extends $DatabaseResult_Success<T>
    implements DatabaseResultI<T> {
  final T data;

  ///
  ///implements [$$DatabaseResultI]
  ///

  ///
  DatabaseResult_Success({
    required this.data,
  });
  String toString() => "(DatabaseResult_Success-data:${data.toString()})";
  int get hashCode => hashObjects([data.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseResult_Success &&
          runtimeType == other.runtimeType &&
          data == other.data;
  DatabaseResult_Success cwDatabaseResultI<T>() {
    return DatabaseResult_Success(
      data: (this as DatabaseResult_Success).data,
    );
  }

  DatabaseResult_Success cwDatabaseResult_Success<T>({
    Opt<T>? data,
  }) {
    return DatabaseResult_Success(
      data: data == null ? this.data as T : data.value as T,
    );
  }
}

extension $DatabaseResult_Success_copyTo_E on $DatabaseResult_Success {}

enum DatabaseResult_Success$ { data }

//x()
///
///implements [$$DatabaseResultI]
///

///
class DatabaseResult_Failure<T> extends $DatabaseResult_Failure<T>
    implements DatabaseResultI<T> {
  final DatabaseResultFailureCode failureCode;
  final String description;

  ///
  ///implements [$$DatabaseResultI]
  ///

  ///
  DatabaseResult_Failure({
    required this.failureCode,
    required this.description,
  });
  String toString() =>
      "(DatabaseResult_Failure-failureCode:${failureCode.toString()}|description:${description.toString()})";
  int get hashCode => hashObjects([failureCode.hashCode, description.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseResult_Failure &&
          runtimeType == other.runtimeType &&
          failureCode == other.failureCode &&
          description == other.description;
  DatabaseResult_Failure cwDatabaseResultI<T>() {
    return DatabaseResult_Failure(
      failureCode: (this as DatabaseResult_Failure).failureCode,
      description: (this as DatabaseResult_Failure).description,
    );
  }

  DatabaseResult_Failure cwDatabaseResult_Failure<T>({
    Opt<DatabaseResultFailureCode>? failureCode,
    Opt<String>? description,
  }) {
    return DatabaseResult_Failure(
      failureCode: failureCode == null
          ? this.failureCode as DatabaseResultFailureCode
          : failureCode.value as DatabaseResultFailureCode,
      description: description == null
          ? this.description as String
          : description.value as String,
    );
  }
}

extension $DatabaseResult_Failure_copyTo_E on $DatabaseResult_Failure {}

enum DatabaseResult_Failure$ { failureCode, description }
