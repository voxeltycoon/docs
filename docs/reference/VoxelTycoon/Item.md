title: Item

# Class Item

Represents an item

Namespace: `VoxelTycoon`

## Constructors

### Item()

Creates new item with default values.

Declaration

```csharp
public Item()
```

## Properties

### AssetId

The item asset's ID.

Declaration

```csharp
public int AssetId { get; set; }
```

| Type | Description    |
| ---- | -------------- |
| int  | ID of the item |

### AssetUri

The item asset's URI.

Declaration

```csharp
public string AssetUri { get; set; }
```

| Type   | Description            |
| ------ | ---------------------- |
| string | URI string of the item |

### Color

The color of the item.

Declaration

```csharp
public Color Color { get; set; }
```

| Type  | Description |
| ----- | ----------- |
| Color | Item color  |

### ConveyorLength

Probably represents the length of the item on a conveyor belt.

Declaration

```csharp
public float ConveyorLength { get; set; }
```

| Type  | Description        |
| ----- | ------------------ |
| float | Length of the item |

### DisplayName

Item's display name.

Declaration

```csharp
public DisplayString DisplayName { get; set; }
```

| Type                              | Description                                               |
| --------------------------------- | --------------------------------------------------------- |
| [DisplayString](./DisplayString) | String (and optional format) representing the item's name |

### IsLiquid

Indicates is the item is a liquid.

Declaration

```csharp
public bool IsLiquid { get; set; }
```

| Type | Description                   |
| ---- | ----------------------------- |
| bool | Is true if the item is liquid |

### Mesh

3D model of the item.

Declaration

```csharp
public Mesh Mesh { get; set; }
```

| Type | Description      |
| ---- | ---------------- |
| Mesh | Mesh of the item |

### Weight

Weight of the item.

Declaration

```csharp
public float Weight { get; set; }
```

| Type  | Description   |
| ----- | ------------- |
| float | Item's weight |
