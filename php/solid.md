## SOLID Design Principle: Robert C. Martin (Uncle Bob)   
* SRP: A class should have one and only one reason to change, meaning that a class should have only one job.  
* OCP: Objects or entities should be open for extension but closed for modification. (Bertrand Meyer)
  - A module will be said to be open if it is still available for extension. For example, it should be possible to add fields to the data structures it contains, or new elements to the set of functions it performs.
  - A module will be said to be closed if it is available for use by other modules. This assumes that the module has been given a well-defined, stable description (the interface in the sense of information hiding)

* LSP: Let q(x) be a property provable about objects of x of type T. Then q(y) should be provable for objects y of type S where S is a subtype of T.  
  - Functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it
  - Derived classes must be substitutable for their base classes.
* ISP: A client should never be forced to implement an interface that it doesn’t use, or clients shouldn’t be forced to depend on methods they do not use.  
  - Many client-specific interfaces are better than one general-purpose interface
* DIP: Entities must depend on abstractions, not on concretions. It states that the high-level module must not depend on the low-level module, but they should depend on abstractions.
  - High-level modules should not depend on low-level modules. Both should depend on abstractions (e.g., interfaces).
  - Abstractions should not depend on details. Details (concrete implementations) should depend on abstractions.

## Package Principles   
Component cohesion
- REP: Reuse/Release Equivalence Principle (The granular of reuse is the granular of release.)
- CRP: Common Reuse Principle (The classes in a component are reused together. If you reuse one of the classes in a component, you reuse them all.)
- CCP: Common Closure Principle 
  * The classes in a component should be closed together against the same kinds of changes. 
  * A change that affects a component affects all the classes in that component and no other components.
Component coupling
- ADP: Acyclic Dependencies Principle
- SDP: Stable-Dependency Principle (Depend in the direction of stability.)
- SAP: Stable-Abstractions Principle (A component should be as abstract as it is stable.)

## Object
CUPID: (Dan North, BDD)   
* Composable: Small surface & minimal dependencies    
* Unix philo: Do one thing well   
* Predictable: behaves as expected and deterministic  
* Idiomatic: Align standards frameworks and house's style    
* Domain-based: Code for solution, not framework    

GRASP: General Responsibility Assignment Software Patterns: 
- Controller: A use case controller should be used to deal with all system events of a use case (eg: UserCtrl - create,delete,manage,etc.. User) 
- Creator: Assign class B the responsibility to create object A if the following apply, Instances of B contain/aggregate/record instances of A
- Indirection: The indirection pattern supports low coupling and reuses potential between two elements by assigning the responsibility of mediation between them to an intermediate object (eg: mvC)
- Information expert: Assign responsibility to the class that has the information needed to fulfill it
- Low coupling: Change in one class having a lower impact on other classes
- High cohesion: Evaluative pattern that attempts to keep objects appropriately focused, manageable and understandable.
- Polymorphism: Responsibility for defining the variation of behaviors based on type is assigned to the type for which this variation happens
- Protected variations: Wrapping the focus of instability with an interface and using polymorphism to create various implementations of this interface
- Pure fabrication: Does not represent a concept in the problem domain, called a "service"

STUPID: Singleton, Tight Coupling, Untestability, Premature Optimizations, Indescriptive Naming et Duplication
