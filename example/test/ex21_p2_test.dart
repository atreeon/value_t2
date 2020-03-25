import 'package:test/test.dart';

import 'ex21_.dart';

main() {
  test("1", () {
    var a = AFactory();
    expect(a.a, "blah");

    var a2 = a.cwA_(a: "changed");
    expect(a2.a, "changed");
  });
}
