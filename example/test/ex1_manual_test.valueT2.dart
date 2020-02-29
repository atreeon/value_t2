part of 'ex1_manual_test.dart';

//nullable does what? (sticks a required and an assert at the end!)

@CopyWithE()
class Pet extends $Pet {
  final String type;
  Pet({
    @required this.type,
  });
}

@CopyWithE()
abstract class PetBase extends $PetBase {
  String get type;
}
