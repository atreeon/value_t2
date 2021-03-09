/// {@macro ValueTX}
const valueT2 = ValueT2();

/// ### ValueT3 will be created before ValueT2, sometimes the generator needs a related class to be built before another.
/// ---
/// {@macro ValueTX}
const valueT3 = ValueT3();

class ValueT2 implements ValueTX {
  /// {@template ValueTX}
  /// ### normal class; prepend class with a single dollar & make abstract
  /// ```
  /// abstract class $MyClass { ...
  /// ```
  /// ---
  /// ### define non final get properties only (no constructor)
  /// ```
  /// String get aValue;
  /// int? get nullableValue;
  /// ```
  /// ---
  /// ### to instantiate or use the class omit the dollar
  /// ```
  /// MyClass(aValue: "x");
  /// ```
  /// ---
  /// ### to implement an interface use [implements]
  /// ```
  /// @ValueT2()
  /// abstract class $B implements $$A<int, String> {
  ///  String get z;
  /// ```
  /// ---
  /// ### abstract classes; prepend class with two dollars
  /// ```
  /// class $$myAbstractClass { ...
  /// ```
  /// ---
  /// ### private constructor for custom constructors; postpend with underscore
  /// ```
  /// abstract class $A_ {
  /// ```
  ///
  /// this then allows default values by defining custom functions in the same file
  ///
  /// ```
  /// A_ AFactory() {
  ///    return A_._(a: "my default value");
  /// }
  /// ```
  ///
  /// it makes it explict that the default constructor cannot be used
  /// {@endtemplate}
  const ValueT2();
}

class ValueT3 implements ValueTX {
  const ValueT3();
}

abstract class ValueTX {}
