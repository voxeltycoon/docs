`Player.log ` is where the game writes all there logs. You can [write there too](/guides/script-mods/debugging-script-mods/#logging) using Unity's [Debug.Log()](https://docs.unity3d.com/ScriptReference/Debug.Log.html) in your [script mods](/assets/dll-asset/).

This file can be found in the next locations:

| Platform | |
| - | - |
| Linux	| ~/.config/unity3d/CompanyName/ProductName/Player.log |
| macOS	| ~/Library/Logs/Company Name/Product Name/Player.log |
| Windows | C:\Users\username\AppData\LocalLow\CompanyName\ProductName\Player.log |

!!! quote "[From Unity's docs:](https://docs.unity3d.com/Manual/LogFiles.html)"
    On Windows and Linux standalones, you can change the location of the log file, or stop Unity from logging to it. For more information, see the [Command line arguments](https://docs.unity3d.com/Manual/CommandLineArguments.html) documentation.