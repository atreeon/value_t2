// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ex2_test.dart';

// **************************************************************************
// ValueT2Generator
// **************************************************************************

class Pet extends $Pet {
  final String type;
  Pet({
    @required this.type,
  }) : assert(type != null);
  String toString() => "(Pet-type:$type)";
  int get hashCode => hashObjects([type.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pet && runtimeType == other.runtimeType && type == other.type;
}

extension PetExt_CopyWithE on Pet {
  Pet cwPet({String type}) {
    if (this is Pet) {
      return Pet(
        type: type == null ? this.type : type,
      );
    }
    throw Exception();
  }
}
