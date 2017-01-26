# Entity–relationship model (ER model) (ERD)

[https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model)

## Relations

### Chen
```
1
N
```

### UML
```
0..1
1..1
0..*  0..N
1..*  1..N
```

### One to One

```
Chen:   []  1     --->    1     []
UML:    []  1..1  --->    1..1  []
```

### One to many

```
Chen:   []  1     --->    N     []
UML:    []  1..1  --->    0..*  []
UML:    []  1..1  --->    0..N  []
```

### Many to many

```
Chen:   []  N     --->    N     []
UML:    []  1..*  --->    1..*  []
UML:    []  1..N  --->    1..N  []
```
