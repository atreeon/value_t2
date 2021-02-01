# value_t2

[value_t2_generator - go here for full details](value_t2_generator/README.md)

Reasoning: specifying clases with copywith, equals, toString, required constructor fields is actually a fair amount of work resulting in verbose code which makes it difficult to maintain and difficult to read.

Solution: use value_t2

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

