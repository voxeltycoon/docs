You can use Unity's [Debug.Log()](https://docs.unity3d.com/ScriptReference/Debug.Log.html) that will output to [Player.log](#player.log).

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

## Player.log

`Player.log ` is where the game writes all its logs. You can [write there too](/guides/script-mods/debugging/writing-logs) using Unity's [Debug.Log()](https://docs.unity3d.com/ScriptReference/Debug.Log.html) in your [script mods](/assets/dll-asset/).

This file can be found in the next locations:

| Platform | |
| - | - |
| Windows | C:\Users\username\AppData\LocalLow\CompanyName\ProductName\Player.log |
| macOS	| ~/Library/Logs/Company Name/Product Name/Player.log |
| Linux	| ~/.config/unity3d/CompanyName/ProductName/Player.log |