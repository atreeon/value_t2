# value_t2

### Reasoning: 
specifying clases with copywith, equals, toString, required constructor fields and other standard features is actually a fair amount of work resulting in verbose code which makes it difficult to maintain and difficult to read.
typeclasses (ish), value types (ish)

### Solution: use value_t2

## Basic features


* Equality

```
var bob1 = Person(age: 5, name: "bob");
var bob2 = Person(age: 5, name: "bob");

bob1 == bob2; //true
```

* CopyWith (works on subclasses in same file)

```
var bob = Employee(age: 5, name: "bob", id: "123);
var bobby = bob.cwPerson(age: 6, name: "bobby");
var robert = bob.cwEmployee(age: 25, name: "robert", id: "123);

bobby is Employee; //true
robert is Employee; //true
```

* ToString

```
var bob = Person(age: 5, name: "bob");
bob.toString() //age:5|name:"bob"
```

* All fields are required, non nullable (through assert pattern) and final by default

```
var bob = Person(age: 5, name: "bob");
bob.age = 6; //error

//warning on missing parameter values
var bob = Person(age: 5);

//assert error if parameter is null
var bob = Person(age: 5, name: null);
```

## More examples
For more examples look at the Examples project in the github repository

## Installation
  * Import value_t2_annotation, value_t2_generator, quiver_hashcode and build_runner
  
```
dependencies:
  value_t2_annotation:
  quiver_hashcode:

dev_dependencies:
  build_runner:
  value_t2_generator
```

## Usage
  * Add three imports at top of each file
  ```
import 'package:meta/meta.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';
```
  
  
  * Place a @ValueT2() annotation on every class
  * Prepend a dollar on the classname or two dollars for abstract classes when defining a class
  * Declare all classes as abstract
 ```
 abstract class $$MyAbstract class {

 abstract class $MyClass class {
```
  * when using the class don't use the dollar sign
```
 MyClass(a: "value")
```
 
   * simple definition
   
 ```
@ValueT2()
abstract class $Pet {
  String get type;
}
 ```
 
* simple definition with implements
    
```
 @ValueT2()
 abstract class $Person {
   String get name;
 }

 @ValueT2()
 abstract class $Employe implements $Person {
   String get id;
 }
  ```

 
  * never use extends, only interfaces
  
```
@ValueT2()
abstract class $B implements $A {
```

## More features

* Shorter and more simple syntax
```
@ValueT2()
abstract class $A {
  String get aValue;
}

//vs

class A {
  final String aValue;

  A({
    @required this.aValue,
  }) : assert(aValue != null);

  //toString, hasCode, ==
}
```


* The properties of interfaces are implemented automatically (no need to specify them, just use implements)

```
@ValueT2()
abstract class $A {
  String get aValue;
}

@ValueT2()
abstract class $B implements $A {
  String get bValue;
}

var b = B(aValue: "A", bValue: "B");
```

* Can override a property of a subclass
```
@ValueT2()
abstract class $A {
  Person get a;
}

@ValueT2()
abstract class $B implements $A {
  Employee get a;
}
```

* Can specify generics
```
@ValueT2()
abstract class $$A<T1, T2> {
  T1 get x;
  T2 get y;
}

@ValueT2()
abstract class $B implements $$A<int, String> {
  String get z;
}
```

## Limitations
* Custom getters are not supported
  * use functions instead
* Methods on a class are not supported (use functions instead)
* 'go to definition' takes you to the generated class
  * workaround1 - to get class info hover over the class
  * workaround2 - go to definition, then go to definition a second time to go to the dollar version of class
  * possible update in the future

## Coming (if others want and are interested)
See github issues


