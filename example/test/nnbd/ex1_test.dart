//NNBD doesn't give you
//  equals
//  copywith
//  shorter syntax (auto properties from interfaces)
//  auto constructor
//  toString

class Pet {
  final String type;
  final String name;

  Pet({
    required this.type,
    required this.name,
  });
}

main() {
  String blah = null;
  print(blah);
}
//main() {
//  test("1", () {
//    var a = Pet(type: "cat", name: null);
//    expect(a.type, "cat");
//  });
//}
