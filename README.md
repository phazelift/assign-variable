# assign-variable
## assign a dynamically type checked value using an optional alternative value

<br/>

Assign dynamically incoming values at runtime with confidence.

Features:

- dynamic type check through alternative value
- return alternative value in case type check fails
- emits a warning message event when type check fails

<br/>

Example
```typescript
const assign = require('assign-variable');

const model = Object.freeze({
	alias: '',
	name: '',
	age: -1,
});

class Store {
	constructor(settings){
		// ensure settings is of type object at runtime
		settings = assign(settings, {});
		// using the model as type guide and possible alternative value
		this.alias = assign(settings.alias, model.alias);
		this.name = assign(settings.name, model.name);
		this.age = assign(settings.age, model.age);
	}
}

const store = new Store({ alias: 'jack', name: undefined, age: null });
console.log(store);
// Store { alias: 'jack', name: '', age: -1 }
```
<br/>

In more detail
```typescript
// allow for warning message events to output to console (this is optional)
assign.onWarn(console.warn);

myVar = assign('ok', undefined);
// ok

// the first value is validated by the second values' type
// when types match, the first value will be returned
myVar = assign('!', '?');
// !

// when the types don't match, the second (alternative) value will be returned
// in addition a warning message event will be emitted
myVar = assign('', 0);
// 0

// the message event emitted:
//	{
//	  sender: 'assign-variable',
//	  type: 'warn',
//	  id: '',
//	  text: 'type mismatch encountered'
//	}

// you can add an id as a third argument that in case of type mismatch
// the message event can show the id if needed for debugging
myVar = assign('', 0, 'myVar');
// 0

// the message event emitted:
//	{
//	  sender: 'assign-variable',
//	  type: 'warn',
//	  id: 'myVar',
//	  text: 'type mismatch encountered'
//	}
```