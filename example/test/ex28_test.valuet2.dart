// ignore_for_file: UNNECESSARY_CAST

part of 'ex28_test.dart';

// **************************************************************************
// Generator: ValueT2Generator<ValueT2>
// **************************************************************************

//x()
///FIELD LIST ENUM
///
class Pet extends $Pet {
  final String? type;
  final String name;

  ///FIELD LIST ENUM
  ///
  Pet({
    this.type,
    required this.name,
  });
  String toString() => "(Pet-type:${type.toString()}|name:${name.toString()})";
  int get hashCode => hashObjects([type.hashCode, name.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pet &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          name == other.name;
  Pet cwPet({
    Opt<String?>? type,
    Opt<String>? name,
  }) {
    return Pet(
      type: type == null ? this.type as String? : type.value as String?,
      name: name == null ? this.name as String : name.value as String,
    );
  }
}

extension $Pet_copyTo_E on $Pet {}

enum Pet$ { type, name }
