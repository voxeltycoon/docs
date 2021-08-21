title: Xz

# Struct Xz

Represents a 2D coordinate.

Namespace: `VoxelTycoon`

## Constructors

### Xz(int)

Creates a new Xz from an integer. X and Z members are set to the integer.

Declaration

```csharp
public Xz(int xz)
```

| Type | Name | Description            |
| ---- | ---- | ---------------------- |
| int  | _xz_ | Value given to X and Z |

### Xz(int, int)

Creates a new Xz from two integers representing X and Z.

Declaration

```csharp
public Xz(int x, int z)
```

| Type | Name | Description  |
| ---- | ---- | ------------ |
| int  | _x_  | X coordinate |
| int  | _z_  | Z coordinate |

### Xz(Vector3)

Creates a new Xz from a 3D vector. Only the x and z coordinates are used.

Declaration

```csharp
public Xz(Vector3 vector3)
```

| Type    | Name      | Description                                    |
| ------- | --------- | ---------------------------------------------- |
| Vector3 | _vector3_ | _vector3_.x is given to X and _vector3_.z to Z |

## Members

### X

X coordinate.

Declaration

```csharp
public int X
```

| Type | Description  |
| ---- | ------------ |
| int  | X coordinate |

### Z

Z coordinate.

Declaration

```csharp
public int Z
```

| Type | Description  |
| ---- | ------------ |
| int  | Z coordinate |


## Properties

### Forward

Xz forward instance, equivalent to Xz(0, 1).

Declaration

```csharp
public static Xz Forward { get; }
```

| Type | Description |
| ---- | ----------- |
| Xz   | Xz(0, 1)    |

### Right

Xz right instance, equivalent to Xz(1, 0).

Declaration

```csharp
public static Xz Right { get; }
```

| Type | Description |
| ---- | ----------- |
| Xz   | Xz(1, 0)    |

### One

Xz one instance, equivalent to Xz(1, 1).

Declaration

```csharp
public static Xz One { get; }
```

| Type | Description |
| ---- | ----------- |
| Xz   | Xz(1, 1)    |

### Zero

Xz zero instance, equivalent to Xz(0, 0).

Declaration

```csharp
public static Xz Zero { get; }
```

| Type | Description |
| ---- | ----------- |
| Xz   | Xz(0, 0)    |

### Volume

Xz's volume, obtained by multiplying X and Z members.

Declaration

```csharp
public int Volume { get; }
```

| Type | Description |
| ---- | ----------- |
| int  | Equals X*Z  |

### this[int]

Gets or sets the X and Z coordinates depending on the given value and index.

Declaration

```csharp
public int this[int i] { get; set; }
```

Parameters

| Type | Name | Description                           |
| ---- | ---- | ------------------------------------- |
| int  | _i_  | X corresponds to _i_=0 and Z to _i_=1 |

Returns

| Type | Description                     |
| ---- | ------------------------------- |
| int  | X or Z depending on _i_'s value |


## Methods

### Abs()

Gets the absolute version of the Xz, equivalent to Xz(abs(x), abs(z)).

Declaration

```csharp
public Xz Abs()
```

| Type | Description         |
| ---- | ------------------- |
| Xz   | Xz(abs(x), abs(z))z |

### Deconstruct(int, int)

Deconstructs the Xz. Returns x and z values.

Declaration

```csharp
public void Deconstruct(out int x, out int z)
```

| Type    | Name | Description  |
| ------- | ---- | ------------ |
| out int | _x_  | X coordinate |
| out int | _z_  | Z coordinate |

### Distance(Xz, Xz)

Returns the distance between two Xz.

Declaration

```csharp
public static float Distance(Xz xz1, Xz xz2)
```

Parameters

| Type | Name  | Description |
| ---- | ----- | ----------- |
| Xz   | _xz1_ | First Xz    |
| Xz   | _xz2_ | Second Xz   |

Returns

| Type  | Description                      |
| ----- | -------------------------------- |
| float | Distance between _xz1_ and _xz2_ |

### DistanceManhattan(Xz, Xz)

Returns the [manhattan (taxicab) distance](https://en.wikipedia.org/wiki/Taxicab_geometry) between two Xz.

Declaration

```csharp
public static float DistanceManhattan(Xz xz1, Xz xz2)
```

Parameters

| Type | Name  | Description |
| ---- | ----- | ----------- |
| Xz   | _xz1_ | First Xz    |
| Xz   | _xz2_ | Second Xz   |

Returns

| Type  | Description                                |
| ----- | ------------------------------------------ |
| float | Manhattan distance between _xz1_ and _xz2_ |

### Equals(object)

Tests if the Xz is equals to the object. They are equal if they are both Xz and their coordinates are equal.

Declaration

```csharp
public override bool Equals(object obj)
```

Parameters

| Type   | Name  | Description                   |
| ------ | ----- | ----------------------------- |
| object | _obj_ | Object to compare the Xz with |

Returns

| Type | Description                               |
| ---- | ----------------------------------------- |
| bool | Returns true if _obj_ is equals to the Xz |

### Equals(Xz)

Tests if two Xz are equals. Two Xzs are equal if their X and Z coordinates are equal.

Declaration

```csharp
public bool Equals(Xz other)
```

Parameters

| Type | Name    | Description        |
| ---- | ------- | ------------------ |
| Xz   | _other_ | Xz to compare with |

Returns

| Type | Description                          |
| ---- | ------------------------------------ |
| bool | Returns true if the two Xz are equal |

### GetHashCode()

Returns the hash code of the Xz.

Declaration

```csharp
public override int GetHashCode()
```

Returns

| Type | Description            |
| ---- | ---------------------- |
| int  | Value of the hash code |

### Max()

Returns the max of the coordinates of the Xz.

Declaration

```csharp
public int Max()
```

Returns

| Type | Description         |
| ---- | ------------------- |
| int  | Max between X and Z |

### Min()

Returns the min of the coordinates of the Xz.

Declaration

```csharp
public int Min()
```

Returns

| Type | Description         |
| ---- | ------------------- |
| int  | Min between X and Z |

### Max(Xz, Xz)

Returns a new Xz with the maximum of the coordinates between the two Xzs.

Declaration

```csharp
public static Xz Max(Xz xz1, Xz xz2)
```

Parameters

| Type | Name  | Description |
| ---- | ----- | ----------- |
| Xz   | _xz1_ | First Xz    |
| Xz   | _xz2_ | Second Xz   |

Returns

| Type | Description                    |
| ---- | ------------------------------ |
| Xz   | Max Xz between _xz1_ and _xz2_ |

### Min(Xz, Xz)

Returns a new Xz with the minimum of the coordinates between the two Xzs.

Declaration

```csharp
public static Xz Min(Xz xz1, Xz xz2)
```

Parameters

| Type | Name  | Description |
| ---- | ----- | ----------- |
| Xz   | _xz1_ | First Xz    |
| Xz   | _xz2_ | Second Xz   |

Returns

| Type | Description                    |
| ---- | ------------------------------ |
| Xz   | Min Xz between _xz1_ and _xz2_ |

### Rotate(BuildingRotation, Xz)

Rotate and translates a Xz.

Declaration

```csharp
public Xz Rotate(BuildingRotation rotation, Xz translation = null)
```

Parameters

| Type             | Name          | Description                             |
| ---------------- | ------------- | --------------------------------------- |
| BuildingRotation | _rotation_    | Rotation to apply to the Xz             |
| Xz               | _translation_ | Optional translation to apply to the Xz |

Returns

| Type | Description                              |
| ---- | ---------------------------------------- |
| Xz   | Rotated and translated version of the Xz |

### SquaredDistance(Xz, Xz)

Returns the squared distance between two Xz.

Declaration

```csharp
public static int SquaredDistance(Xz xz1, Xz xz2)
```

Parameters

| Type | Name  | Description |
| ---- | ----- | ----------- |
| Xz   | _xz1_ | First Xz    |
| Xz   | _xz2_ | Second Xz   |

Returns

| Type | Description                              |
| ---- | ---------------------------------------- |
| int  | Squared distance between _xz1_ and _xz2_ |

### ToString()

Returns a string representing the Xz.

Declaration

```csharp
public override string ToString()
```

Returns

| Type   | Description                |
| ------ | -------------------------- |
| string | String representing the Xz |

## Operators

### +(Xz, Xz)

Returns the sum of two Xz which is calculated by the sum of each coordinates.

Declaration

```csharp
public static Xz operator +(Xz xz, Xz xz2)
```

Parameters

| Type | Name  | Description |
| ---- | ----- | ----------- |
| Xz   | _xz_  | First Xz    |
| Xz   | _xz2_ | Second Xz   |

Returns

| Type | Description           |
| ---- | --------------------- |
| Xz   | Sum of _xz_ and _xz2_ |

### -(Xz, Xz)

Returns the substraction of two Xz which is calculated by the substraction of each coordinates.

Declaration

```csharp
public static Xz operator -(Xz xz, Xz xz2)
```

Parameters

| Type | Name  | Description |
| ---- | ----- | ----------- |
| Xz   | _xz_  | First Xz    |
| Xz   | _xz2_ | Second Xz   |

Returns

| Type | Description                    |
| ---- | ------------------------------ |
| Xz   | Substraction of _xz_ and _xz2_ |

### *(Xz, Xz)

Returns the multiplication of two Xz which is calculated by the multiplication of each coordinates.

Declaration

```csharp
public static Xz operator *(Xz xz1, Xz xz2)
```

Parameters

| Type | Name  | Description |
| ---- | ----- | ----------- |
| Xz   | _xz1_ | First Xz    |
| Xz   | _xz2_ | Second Xz   |

Returns

| Type | Description                       |
| ---- | --------------------------------- |
| Xz   | Multiplication of _xz1_ and _xz2_ |

### /(Xz, Xz)

Returns the division of two Xz which is calculated by the division of each coordinates.

Declaration

```csharp
public static Xz operator /(Xz xz1, Xz xz2)
```

Parameters

| Type | Name  | Description |
| ---- | ----- | ----------- |
| Xz   | _xz1_ | First Xz    |
| Xz   | _xz2_ | Second Xz   |

Returns

| Type | Description                 |
| ---- | --------------------------- |
| Xz   | Division of _xz1_ and _xz2_ |

### *(Xz, int)

Returns the multiplication between an integer and a Xz. The result is calculated by multiplying each Xz coordinate by the integer.

Declaration

```csharp
public static Xz operator *(Xz xz, int a)
```

Parameters

| Type | Name | Description         |
| ---- | ---- | ------------------- |
| Xz   | _xz_ | Xz to multiply      |
| int  | _a_  | Integer to multiply |

Returns

| Type | Description                   |
| ---- | ----------------------------- |
| Xz   | Multiplication of _xz_ by _a_ |

### /(Xz, int)

Returns the division of a Xz by an integer. The result is calculated by dividing each Xz coordinate by the integer.

Declaration

```csharp
public static Xz operator /(Xz xz, int a)
```

Parameters

| Type | Name | Description |
| ---- | ---- | ----------- |
| Xz   | _xz_ | Divendent   |
| int  | _a_  | Divider     |

Returns

| Type | Description             |
| ---- | ----------------------- |
| Xz   | Division of _xz_ by _a_ |

### /(Xz, float)

Returns the division of Xz by a float in a Vector3. The result is calculated by dividing each Xz coordinate by the float. The Y coordinate is set to 0.

Declaration

```csharp
public static Vector3 operator /(Xz xz, float a)
```

Parameters

| Type  | Name | Description |
| ----- | ---- | ----------- |
| Xz    | _xz_ | Divendent   |
| float | _a_  | Divider     |

Returns

| Type    | Description                          |
| ------- | ------------------------------------ |
| Vector3 | Contains the division of _xz_ by _a_ |

### -(Xz)

Returns the opposite of the Xz which is calculated by getting the opposite of each coordinate.

Declaration

```csharp
public static Xz operator -(Xz xz)
```

Parameters

| Type | Name | Description |
| ---- | ---- | ----------- |
| Xz   | _xz_ | Xz provided |

Returns

| Type | Description      |
| ---- | ---------------- |
| Xz   | Opposite of _xz_ |

### Vector2(Xz)

Returns a Vector2 from a Xz.

Declaration

```csharp
public static implicit operator Vector2(Xz xz)
```

Parameters

| Type | Name | Description |
| ---- | ---- | ----------- |
| Xz   | _xz_ | Xz provided |

Returns

| Type    | Description                                            |
| ------- | ------------------------------------------------------ |
| Vector2 | Contains _xz_'s coordinates in its X and Y coordinates |

### Vector3(Xz)

Returns a Vector3 from a Xz. The Y coordinate is set to 0.

Declaration

```csharp
public static explicit operator Vector3(Xz xz)
```

Parameters

| Type | Name | Description |
| ---- | ---- | ----------- |
| Xz   | _xz_ | Xz provided |

Returns

| Type    | Description                                            |
| ------- | ------------------------------------------------------ |
| Vector3 | Contains _xz_'s coordinates in its X and Z coordinates |

### Xyz(Xz)

Returns a [Xyz](./Xyz) with a Xz's coordinates. The Y coordinate is set to 0.

Declaration

```csharp
public static explicit operator Xyz(Xz xz)
```

Parameters

| Type | Name | Description |
| ---- | ---- | ----------- |
| Xz   | _xz_ | Xz provided |

Returns

| Type         | Description                                            |
| ------------ | ------------------------------------------------------ |
| [Xyz](./Xyz) | Contains _xz_'s coordinates in its X and Z coordinates |

### Xz(Xyz)

Returns a Xz with a [Xyz](./Xyz)'s coordinates. The Y coordinate is not kept.

Declaration

```csharp
public static explicit operator Xyz(Xz xz)
```

Parameters

| Type         | Name  | Description  |
| ------------ | ----- | ------------ |
| [Xyz](./Xyz) | _xyz_ | Xyz provided |

Returns

| Type | Description                          |
| ---- | ------------------------------------ |
| Xz   | Contains _xyz_'s X and Z coordinates |

### ==(Xz, Xz)

Returns true if the two provided Xzs are equal.

Declaration

```csharp
public static bool operator ==(Xz a, Xz b)
```

Parameters

| Type | Name | Description |
| ---- | ---- | ----------- |
| Xz   | _a_  | First Xz    |
| Xz   | _b_  | Second Xz   |

Returns

| Type | Description                   |
| ---- | ----------------------------- |
| bool | True if _a_ and _b_ are equal |

### !=(Xz, Xz)

Returns false if the two provided Xzs are equal.

Declaration

```csharp
public static bool operator !=(Xz a, Xz b)
```

Parameters

| Type | Name | Description |
| ---- | ---- | ----------- |
| Xz   | _a_  | First Xz    |
| Xz   | _b_  | Second Xz   |

Returns

| Type | Description                    |
| ---- | ------------------------------ |
| bool | False if _a_ and _b_ are equal |