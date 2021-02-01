You can use Unity's [Debug.Log()](https://docs.unity3d.com/ScriptReference/Debug.Log.html) that will output to [Player.log](/concepts/player.log).

There's also a `Logger` class provided by Voxel Tycoon API to get nicer output:

```csharp
public class MyMod : Mod
{
    _logger = new Logger<MyMod>();

    public void Initialize()
    {
        _logger.Log("Initialized!");
    }
}
```

Output:
```log
[1/31/2021 11:42:45 PM] [MyMod] Initialized!
```