///append class with a dollar, two dollars for abstract classes
/// $myClass / $$myAbstractClass
class ValueT2 {
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
  /// ### to use the class omit the dollar
  /// ```
  /// MyClass(aValue: "x");
  /// ```
  /// ---
  /// ### to implement an interface use [implements]
  /// ```
  /// MyClass(aValue: "x");
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
  const ValueT2();
}
