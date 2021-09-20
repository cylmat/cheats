SOLID: Robert C. Martin (Uncle Bob)   
* SRP: A class should have one and only one reason to change, meaning that a class should have only one job.  
* OCP: Objects or entities should be open for extension but closed for modification.  
* LSP: Let q(x) be a property provable about objects of x of type T. Then q(y) should be provable for objects y of type S where S is a subtype of T.  
* ISP: A client should never be forced to implement an interface that it doesn’t use, or clients shouldn’t be forced to depend on methods they do not use.  
* DIP: Entities must depend on abstractions, not on concretions. It states that the high-level module must not depend on the low-level module, but they should depend on abstractions.
  - High-level modules should not depend on low-level modules. Both should depend on abstractions (e.g., interfaces).
  - Abstractions should not depend on details. Details (concrete implementations) should depend on abstractions.

Component cohesion


Component coupling
- REP: Reuse/Release Equivalence Principle (The granular of reuse is the granular of release.)
- CRP: Common Reuse Principle (The classes in a component are reused together. If you reuse one of the classes in a component, you reuse them all.)
- CCP: Common Closure Principle 
  * The classes in a component should be closed together against the same kinds of changes. 
  * A change that affects a component affects all the classes in that component and no other components.
- ADP: Acyclic Dependencies Principle
- SDP: Stable-Dependency Principle (Depend in the direction of stability.)
- SAP: Stable-Abstractions Principle (A component should be as abstract as it is stable.)


CUPID: (Dan North, BDD)   
* Composable: Small surface & minimal dependencies    
* Unix philo: Do one thing well   
* Predictable: behaves as expected and deterministic  
* Idiomatic: Align standards frameworks and house's style    
* Domain-based: Code for solution, not framework    

GRASP: General Responsibility Assignment Software Patterns: Controller, creator, indirection, information expert, low coupling, high cohesion, polymorphism, protected variations, pure fabrication
