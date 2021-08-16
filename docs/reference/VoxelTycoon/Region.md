title: Region

# Class Region

Represents a region

Namespace: `VoxelTycoon`

## Constructors

### Region(int, Xz, Xz, Xz, int, int)

Creates a new region.

Declaration

```csharp
public Region(int id, Xz minIndex, Xz maxIndex, Xz center, int tier, int subregionSize)
```

| Type       | Name            | Description          |
| ---------- | --------------- | -------------------- |
| int        | _id_            | Region's ID          |
| [Xz](./Xz) | _minIndex_      | Minimum index        |
| [Xz](./Xz) | _maxIndex_      | Maximum index        |
| [Xz](./Xz) | _center_        | Center of the region |
| int        | _tier_          | Tier of the region   |
| int        | _subregionSize_ | Size of the region   |

### Region(StateBinaryReader)

Creates a new region from provided binary reader.

Declaration

```csharp
public Region(StateBinaryReader reader)
```

| Type                                                    | Name     | Description               |
| ------------------------------------------------------- | -------- | ------------------------- |
| [StateBinaryReader](../Serialization/StateBinaryReader) | _reader_ | Reader with region values |

## Properties

### Area

Represents the region's area.

Declaration

```csharp
public HashSet<Xz> Area { get; }
```

| Type                | Description                        |
| ------------------- | ---------------------------------- |
| HashSet<[Xz](./Xz)> | List of Xzs included in the region |

### Biome

Region's biome.

Declaration

```csharp
public Biome Biome { get; }
```

| Type                | Description    |
| ------------------- | -------------- |
| [Biome](./Biome.md) | Region's biome |

### Center

Region's center.

Declaration

```csharp
public Xz Center { get; }
```

| Type       | Description                            |
| ---------- | -------------------------------------- |
| [Xz](./Xz) | Coordinates(Xz) of the region's center |

### Cities

Region's cities.

Declaration

```csharp
public ImmutableList<Cities.City> Cities { get; }
```

| Type                                 | Description                 |
| ------------------------------------ | --------------------------- |
| ImmutableList<[City](./Cities/City)> | List of the region's cities |

### ColliderPath

Region's collider path.

Declaration

```csharp
public Vector2[] ColliderPath { get; }
```

| Type      | Description                              |
| --------- | ---------------------------------------- |
| Vector2[] | List of 2D vectors representing the path |

### Deposits

Region's deposits.

Declaration

```csharp
public ImmutableList<Deposit> Deposits { get; }
```

| Type                                         | Description                   |
| -------------------------------------------- | ----------------------------- |
| ImmutableList<[Deposit](./Deposits/Deposit)> | List of the region's deposits |

### Id

Region's ID.

Declaration

```csharp
public int Id { get; }
```

| Type | Description |
| ---- | ----------- |
| int  | Region's ID |

### MaxIndex

Region's max index.

Declaration

```csharp
public Xz MaxIndex { get; }
```

| Type       | Description        |
| ---------- | ------------------ |
| [Xz](./Xz) | Region's max index |

### MinIndex

Region's min index.

Declaration

```csharp
public Xz MinIndex { get; }
```

| Type       | Description        |
| ---------- | ------------------ |
| [Xz](./Xz) | Region's min index |

### Name

Region's name.

Declaration

```csharp
public string Name { get; set; }
```

| Type   | Description   |
| ------ | ------------- |
| string | Region's name |

### Price

Region's price.

Declaration

```csharp
public double Price { get; }
```

| Type   | Description    |
| ------ | -------------- |
| double | Region's price |

### State

Current state of the region.

Declaration

```csharp
public RegionState State { get; }
```

| Type                         | Description    |
| ---------------------------- | -------------- |
| [RegionState](./RegionState) | Region's state |

### Subregions

Sub regions of the region.

Declaration

```csharp
public List<Xz> Subregions { get; }
```

| Type             | Description             |
| ---------------- | ----------------------- |
| List<[Xz](./Xz)> | List of the sub regions |

### Tier

Region's tier.

Declaration

```csharp
public int Tier { get; }
```

| Type | Description   |
| ---- | ------------- |
| int  | Region's tier |


## Methods

### GetDistance(Xz)

Gets the distance beween **?**.

Declaration

```csharp
public int GetDistance(Xz regionIndex)
```

Parameters

| Type | Name          | Description |
| ---- | ------------- | ----------- |
| int  | _regionIndex_ | **?**       |

### InvalidateBorderOpacity()

Invalidates the region's border opacity.

Declaration

```csharp
public void InvalidateBorderOpacity()
```

### InvalidateBorderVisibility()

Invalidates the region's border visibility.

Declaration

```csharp
public void InvalidateBorderVisibility()
```

### OnDrawGizmos()

Probably called when gizmos is drawn.

Declaration

```csharp
public void OnDrawGizmos()
```

### RegisterDeposit(Deposit)

Registers a deposit in the region.

Declaration

```csharp
public void RegisterDeposit(Deposit deposit)
```

Parameters

| Type                          | Name      | Description         |
| ----------------------------- | --------- | ------------------- |
| [Deposit](./Deposits/Deposit) | _deposit_ | Deposit to register |

### SetState(RegionState)

Sets the region's state.

Declaration

```csharp
public void SetState(RegionState state)
```

Parameters

| Type                         | Name    | Description                          |
| ---------------------------- | ------- | ------------------------------------ |
| [RegionState](./RegionState) | _state_ | Region state to be set on the region |

### UnregisterDeposit(Deposit)

Unregisters a deposit in the region.

Declaration

```csharp
public void UnregisterDeposit(Deposit deposit)
```

Parameters

| Type                          | Name      | Description           |
| ----------------------------- | --------- | --------------------- |
| [Deposit](./Deposits/Deposit) | _deposit_ | Deposit to unregister |

### Write(StateBinaryWriter)

Probably writes the region's values.

Declaration

```csharp
public void Write(StateBinaryWriter writer)
```

| Type                                                    | Name     | Description               |
| ------------------------------------------------------- | -------- | ------------------------- |
| [StateBinaryWriter](../Serialization/StateBinaryWriter) | _writer_ | Writer with region values |

