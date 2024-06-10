@https://www.typescriptlang.org/docs/handbook/2/template-literal-types.html  
@https://en.wikipedia.org/wiki/TypeScript  
@https://www.w3schools.com/typescript  

- Build  
Gulp, Browserify, terser, or Watchify to the gulp pipeline, Babelify.  

### Alias

```
type CarYear = number

- interface is an "object" alias
interface Rectangle {
  height: number,
  width: number
}

interface ColoredRectangle extends Rectangle {
  color: string
}

- function type

type strNum = (test: number) => number
// in this function, the parameter `value` automatically gets assigned the type `number` 
const myVal: strNum = (test) => test - 1 
console.log(myVal(5))

- or

type StringMap = { [key: string]: unknown };
```

### casting

const test: unknown = 7  
console.log((test as string))  

### interface

```
export interface Props {
    defaultData?: any;
    cancel: () => void;
    onSubmit: FormProps<any>["onSubmit"];
	formProps?: Partial<FormProps<any>>;
    variant?:
    | 'primary'
    | 'secondary'
    | 'success';
	
const widgets: any = rest.widgets ? rest.widgets : {};
const onFormChange = (e: any) => {}

wrapInArray(obj: string | string[]) {
  if (typeof obj === "string") {
```

----
use:
----

```
interface Backpack<Type> {
  add: (obj: Type) => void;
  get: () => Type;
}

// This line is a shortcut to tell TypeScript there is a
// constant called `backpack`, and to not worry about where it came from.
declare const backpack: Backpack<string>;

backpack.add('23');
```

-----
use2:
-----

```
interface Point {
    x: number;
    y: number;
}

function logPoint(p: Point) {
    console.log(`${p.x}, ${p.y}`)
}

const point: Point = {x: 9, y: 5}
logPoint(point)
```

### keyof

interface Person {name: string, age: number}  
function printPerso(person: Person, property: keyof Person) {}  
printPerso({name: "alpha", age: 9}, "not-name") // error: must be "name" or "age"  

### GENERIC

```
-sample with fct

function createPair<S, Arf>(v1: S, v2: Arf): [S, Arf] {
  return [v1, v2];
}
console.log(createPair<string, number>('hello', 42)); // ['hello', 42]

- and

function createPair<Arf>(v1: S, v2: Arf): [S, string] {
  return [v1, 'test'];
}
console.log(createPair<string, number>('hello', 42)); // Arf not used

- or

function createPair<Arf>(v2: Arf): [string] {
  return ['test'];
}
console.log(createPair<number>(42)); // Arf not used

- use with classes

class NamedValue<T> {
  private _value: T | undefined;
  // etc...

- with default value

type Wrapped<T = string> = { value: T };

- constraint sample

function createLoggedPair<S extends string | number, T extends string | number>(v1: S, v2: T): [S, T] {
  console.log(`creating pair: v1='${v1}', v2='${v2}'`);
  return [v1, v2];
}
```

### utilities

```
let pointPart: Partial<Point> = {}; // `Partial` allows x and y to be optional
let myCar: Required<Car> = {mileage: 123} // `Required` forces "mileage" to be defined
Record<string, number> is equivalent to { [key: string]: number }
-
interface Person { name: string; age: number; location?: string; }
const bob: Omit<Person, 'age' | 'location'> = {
  name: 'Bob' // `Omit` has removed age and location from the type and they can't be defined here
};
const bob: Pick<Person, 'name'> = {
  name: 'Bob' // `Pick` has only kept name, so age and location were removed from the type and they can't be defined here
};
-
type Primitive = string | number | boolean
const value: Exclude<Primitive, string> = true; // a string cannot be used here since Exclude removed it from the type.
const person: Readonly<Person> = {/*...*/}
-
for fct: ReturnType, Parameters
```

### tuples

// is like array  
declare function swap(x: [number, string]): [string, number];  

###sample

type StringArray = Array<string>;    
type NumberArray = Array<number>;    
type ObjectWithNameArray = Array<{ name: string }>;  

### Special

```
let v: any = true;
let x: never = true; // Error: Type 'boolean' is not assignable to type 'never'. 
let y: undefined = undefined;
let z: null = null;
```

### readonly

const names: readonly string[] = ["Dylan"];  
