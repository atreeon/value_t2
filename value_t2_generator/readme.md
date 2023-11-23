# value_t2
value_t2 is a code generation tool that can create copyWith, equals, toString, contructors and json to & from.
It's a bit like freezed or built_value but inheritance is allowed and polymorphism is supported.
There may be some edge cases so try it out and let me know how you get on.

### Reasoning:
We need a way to simplify our Dart classes, keep things cleaner and provide more functionality.

### Why Not Freezed or Built Value?
Well the main reason; I actually wrote this before Freezed was released.
Freezed is really good, established and well used.  
However if you prefer more of an inheritance based approach to code gen this might suit your needs.
Build Value is also good but I find ValueT2 more concise than Built Value.


### Solution: use value_t2

## Simple Example
To create a new class.
1. add the packages value_t2_annotation, value_t2_generator and build_runner to your pubspec.yaml
2. copy and paste the following code into a new dart file:
   ```
    import 'package:value_t2_annotation/value_t2_annotation.dart';
    part 'Pet.valuet2.dart';
    
    @valueT2
    abstract class $Pet {
      String get type;
    }
    ```

3. `$Pet` is the class definition name. The generated class, the one you use to create objects, will drop the dollar, ie `Pet`
4. your fields are defined using public getters, ie `String get type`
5. and that's it; you then get loads of functionality and create your objects!

```
   var cat = Pet(type: "cat");
```

## Basic features (comes with every class)

### Equality (and hashCode)

ValueT2 supports deep equality out of the box.

```
var cat1 = Pet(type: "cat");
var cat2 = Pet(type: "cat");

expect(cat1 == cat2, true);
```

### A constructor is created for each class

All fields are required, non nullable and final by default

```
var cat1 = Pet(type: "cat");
```

### CopyWith

A simple copy with implementation comes with every class.  
Just specify the fields you want to copy and the others will be copied over.
New values must be wrapped in an optional `Opt` class.

```
var flossy = Pet(name: "Flossy", age: 5);
var plossy = flossy.copyWith_Pet(name: Opt("Plossy"));

expect(flossy.age, plossy.age);
```

### ToString

A default toString implementation is also included.

```
    var flossy = Pet(name: "Flossy", age: 5);

    expect(flossy.toString(), "(Pet-name:Flossy|age:5)");
```

### Inheritance

You can inherit one value_t2 class from another - use the implements keyword and the class definition name (the one with the dollar).
All properties will be inherited by default.

    @valueT2
    abstract class $Cat implements $Pet {
      int get whiskerLength;
    }
    
    var bagpussCat = Cat(whiskerLength: 13.75, name: "Bagpuss", age: 4);
    
    expect(bagpussCat.whiskerLength, 13.75);

### CopyWith Polymorphic

Unlike other copy with implementations, valueT2 works on subclasses within the same file.
For example if you have a list of Person objects of which some are subtypes (Managers and Employees)
then the copyWith still works whilst preserving the underlying type.

    var pets = [
      Cat(whiskerLength: 13.75, name: "Bagpuss", age: 4),
      Dog(woofSound: "rowf", name: "Colin", age: 4),
    ];
    
    var petsOlder = pets //
        .map((e) => e.copyWith_Pet(age: Opt(e.age + 1)))
        .toList();
    
    expect(petsOlder[0].age, 5);
    expect(petsOlder[1].age, 5);

Importantly the type remains the same, it is not converted to a Pet class.

    expect(petsOlder[0].runtimeType, Cat);
    expect(petsOlder[1].runtimeType, Dog);

### Enums are allowed

    @valueT2
    abstract class $Fish implements $Pet {
      eFishColour get fishColour;
    }

    var goldie = Fish(fishColour: eFishColour.gold, name: "Goldie", age: 2);
    expect(goldie.fishColour, eFishColour.gold);

### Generics are allowed

Specify the class definition if you want to constrain your generic type (use the dollar)

    @valueT2
    abstract class $PetOwner<TPet extends $Pet> {
      String get ownerName;
      TPet get pet;
    }

    var cathy = PetOwner<Cat>(ownerName: "Cathy", pet: bagpussCat);
    var dougie = PetOwner<Dog>(ownerName: "Dougie", pet: colin);
    
    expect(cathy.pet.whiskerLength, 13.75);
    expect(dougie.pet.woofSound, "rowf");

### ChangeTo

Sometimes you might want to turn a super class into a subclass (Pet into a Cat)

    var flossy = Pet(name: "Flossy", age: 5);

    var bagpussCat = flossy.changeTo_Cat(whiskerLength: 13.75);

    expect(bagpussCat.whiskerLength, 13.75);
    expect(bagpussCat.runtimeType, Cat);

(subclass to super and sibling to sibling may also work.  A later release will iron out any edge cases)

### Convert object to Json

In order to convert the object to Json specify the `generateJson`.

    @ValueT2(generateJson: true)
    abstract class $Pet {

Then use the toJson_2 method to generate the JSON

    var json = flossy.toJson_2({});
    expect(json, {'name': 'Flossy', 'age': 5, '_className_': 'Pet'});

### Convert Json to Object

Use the factory method `Pet.fromJson()` to create the new object.

    var json = {'name': 'Flossy', 'age': 5, '_className_': 'Pet'};

    var flossyFromJson = Pet.fromJson(json);
    var flossy = Pet(name: "Flossy", age: 5);

    expect(flossyFromJson == flossy, true);

### Json to Object Polymorphism

Unlike other json conversions you can convert subtypes using the super types toJson and fromJson functions.

The subtypes must be specified in the explicitSubTypes and in the correct order for this to work.

    @ValueT2(generateJson: true, explicitSubTypes: [$Z, $Y])
    abstract class $X {
      String get val;
    }
    
    @ValueT2(generateJson: true, explicitSubTypes: [$Z])
    abstract class $Y implements $X {
      int get valY;
    }
    
    @ValueT2(generateJson: true)
    abstract class $Z implements $Y {
      double get valZ;
    }

    var toJsonAs = [
      X(val: "x"),
      Y(val: "xy", valY: 1),
      Z(val: "xyz", valY: 2, valZ: 4.34),
    ];

We can then just convert our list of A objects to JSON preserving their original type.

    var result = toJsonAs.map((e) => e.toJson_2({})).toList();

    var resultJson = [
      {'val': 'x', '_className_': 'X'},
      {'val': 'xy', 'valY': 1, '_className_': 'Y'},
      {'val': 'xyz', 'valY': 2, 'valZ': 4.34, '_className_': 'Z'}
    ];

    expect(result, resultJson);

and then convert them back again, continuing to preserve their original type

    var resultObjects = resultJson.map((e) => X.fromJson(e)).toList();

    expect(resultObjects, toJsonAs);

Also generics work and more complicated inheritance hierarchies. (see the tests ex52 in the example folder)

### Multiple Inheritance

We also allow multiple inheritance.

    var frankie = FrankensteinsDogCat(whiskerLength: 13.75, woofSound: "rowf", name: "frankie", age: 1);

    expect(frankie is Cat, true);
    expect(frankie is Dog, true);

### Custom Constructors

To allow custom constructors you can simply create a function that creates a new class.
If you'd like to hide the automatic constructor end your function with an underscore.
If you hide the constructor the custom one should belong in the same file that you defined your class.

    A_ a_Constructor(String val){
      return A_._(val: val, timestamp: DateTime(2023,11,25));
    }

    var a = a_Constructor("my value");

    expect(a.timestamp, DateTime(2023,11,25));

### Optional Parameters

Optional parameters can be specified using the ? keyword on the getter property.

    @valueT2
    abstract class $B {
      String get val;
      String? get optional;
    }

    var b = B(val: "5");

    expect(b.optional, null);

### Comments

Comments are copied from the class definition to the generated class
and for ease of use copied to the constructor too.

### Constant Constructor

Just define a blank const constructor in your class definition file

    const $A();


### Other

Self referencing classes are allowed.

Overriding properties with a sub type in a subclass is allowed.

If you need to navigate back to the class definition (not the generated code) it is
a kind of two step route back.  You must go to the generated and then you can click on the
$ version of the class which will be next to it.

Sometimes one class needs to be built before another.
In that scenario use valueT3 as the annotation in one class and valueT2 in the other.  