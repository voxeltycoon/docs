title: Mod

# Abstract Class Mod

Represents a script mod

Namespace: `VoxelTycoon.Modding`

## Constructors

**This class is abstract (must have implementation, can only be inherited)**

```csharp
public abstract class Mod
```

## Methods

### Deinitialize()

Called when deinitializing a mod

Declaration

```csharp
protected internal virtual void Deinitialize()
```

### Initialize()

Called when initializing a mod

Declaration

```csharp
protected internal virtual void Initialize()
```

### OnGameStarted()

Called when game started (loaded)

Declaration

```csharp
protected internal virtual void OnGameStarted()
```

### OnGameStarting()

Called when game is starting (loading)

Declaration

```csharp
protected internal virtual void OnGameStarting()
```

### OnLateUpdate()

Called with Unity's OnLateUpdate

Declaration

```csharp
protected internal virtual void OnLateUpdate()
```

### OnModsInitialized()

Called when all mods have been initialized

Declaration

```csharp
protected internal virtual void OnModsInitialized()
```

### OnUpdate()

Called with Unity's OnUpdate

Declaration

```csharp
protected internal virtual void OnUpdate()
```

### Read(StateBinaryReader)

Called when loading a game. Allows a mod to load data from the save file.

Declaration

```csharp
protected internal virtual void Read(StateBinaryReader reader)
```

Parameters

| Type                                                                | Name     | Description           |
| ------------------------------------------------------------------- | -------- | --------------------- |
| [StateBinaryReader](../VoxelTycoon/Serialization/StateBinaryReader) | _reader_ | Used to load the data |

### Write(StateBinaryWriter)

Called when saving a game. Allows a mod to store data from the save file.

Declaration

```csharp
protected internal virtual void Write(StateBinaryWriter writer)
```

Parameters

| Type                                                                | Name     | Description            |
| ------------------------------------------------------------------- | -------- | ---------------------- |
| [StateBinaryWriter](../VoxelTycoon/Serialization/StateBinaryWriter) | _writer_ | Used to store the data |
