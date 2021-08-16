title: Biome

# Class Biome

Represents a biome

Namespace: `VoxelTycoon`

## Constructor

### Biome()

Creates new biome with default values.

Declaration

```csharp
public Biome()
```

## Properties

### Ambient

Audioclip used as an ambient sound.

Declaration

```csharp
public AudioClip Ambient { get; set; }
```

| Type      | Description                   |
| --------- | ----------------------------- |
| AudioClip | Audio clip used for the biome |


### AssetId

The biome asset's ID.

Declaration

```csharp
public int AssetId { get; set; }
```

| Type | Description     |
| ---- | --------------- |
| int  | ID of the biome |

### BodyColor

Color of the biome.

Declaration

```csharp
public Color BodyColor { get; set; }
```

| Type  | Description   |
| ----- | ------------- |
| Color | Biome's color |

### Bumpiness

Biome's bumpiness.

Declaration

```csharp
public float Bumpiness { get; set; }
```

| Type  | Description            |
| ----- | ---------------------- |
| float | Value of the bumpiness |

### CoverColor

Biome's cover color.

Declaration

```csharp
public Color CoverColor { get; set; }
```

| Type  | Description         |
| ----- | ------------------- |
| Color | Biome's cover color |

### DisplayName

Biome's display name.

Declaration

```csharp
public DisplayString DisplayName { get; set; }
```

| Type                              | Description                                                |
| --------------------------------- | ---------------------------------------------------------- |
| [DisplayString](./DisplayString) | String (and optional format) representing the biome's name |

### Hidden

Indicates whether the biome is hidden or not.

Declaration

```csharp
public bool Hidden { get; set; }
```

| Type | Description                 |
| ---- | --------------------------- |
| bool | Whether the biome is hidden |

### Humidity

Represents the biome's humidity.

Declaration

```csharp
public float Humidity { get; set; }
```

| Type  | Description      |
| ----- | ---------------- |
| float | Biome's humidity |

### LiveryTag

Biome's livery tag.

Declaration

```csharp
public string LiveryTag { get; set; }
```

| Type   | Description        |
| ------ | ------------------ |
| string | Biome's livery tag |

### Plants

Biome's plants.

Declaration

```csharp
public ImmutableList<PlantProbability> Plants { get; }
```

| Type                            | Description    |
| ------------------------------- | -------------- |
| ImmutableList<PlantProbability> | List of Plants |

### Sounds

Represents the biome's sounds.

Declaration

```csharp
public Audio.SoundProbabilityCollection Sounds { get; set; }
```

| Type                             | Description    |
| -------------------------------- | -------------- |
| Audio.SoundProbabilityCollection | Biome's sounds |

### Tags

Biome's tags.

Declaration

```csharp
public ImmutableUniqueList<string> Tags { get; }
```

| Type                        | Description       |
| --------------------------- | ----------------- |
| ImmutableUniqueList<string> | Biome's tags list |

### Temperature

Biome's temperature.

Declaration

```csharp
public float Temperature { get; set;}
```

| Type  | Description         |
| ----- | ------------------- |
| float | Biome's temperature |


## Methods

### SetPlants(IList<PlantProbability>)

Sets the biome's plants.

Declaration

```csharp
public void SetPlants(IList<PlantProbability> plants)
```

Parameters

| Type                    | Name     | Description    |
| ----------------------- | -------- | -------------- |
| IList<PlantProbability> | _plants_ | Biome's plants |

### SetTags(IList<string>)

Sets the biome's tags.

Declaration

```csharp
public void SetTags(IList<string> tags)
```

Parameters

| Type          | Name   | Description  |
| ------------- | ------ | ------------ |
| IList<string> | _tags_ | Biome's tags |
