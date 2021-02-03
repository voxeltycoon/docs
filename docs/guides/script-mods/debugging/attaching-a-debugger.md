!!! quote "This guide is an adaptation of [this post](https://ludeon.com/forums/index.php?topic=51589.0) by **CuteLasty**"

## Prerequirements

* This guide assumes you know how to use Visual Studio debugger. If not, first get familiar with it in this [this step-by-step walkthrough](https://docs.microsoft.com/en-us/visualstudio/get-started/csharp/tutorial-debugger?view=vs-2019).

* You Visual Studio installation should have [Visual Studio Tools for Unity][1] installed.

## Extract development files from Unity installation

1. First, you need to determine what version of Unity used to build the game. To do so, see properties of `UnityPlayer.dll` file from the game folder. Under *Details* tab, there's *Product version* property. For example, if this property contains something like `2020.2.2.1234` we need **2020.2.2** version of Unity.
1. [Download](https://unity3d.com/get-unity/download/archive) and install correct version (2020.2.2 in our case) of Unity. Don't choose any additional components other than Unity itself. It can be uninstalled after finishing this guide, so don't care much where you install it, but remember the folder.
1. After installation complete, navigate to the folder where you just installed Unity, then to the `Editor\Data\PlaybackEngines\windowsstandalonesupport\Variations\win64_development_mono\` subfolder, and do the following:

    | File | Action |
    | - | - |
    | `UnityPlayer.dll` | Replace the one in the game folder |
    | `WinPixEventRuntime.dll` | Replace the one in the game folder |
    | `WindowsPlayer.exe` | Replace `VoxelTycoon.exe` in the game folder |
 <!-- copy `UnityPlayer.dll`, `WinPixEventRuntime.dll`, and `WindowsPlayer.exe` into the game folder, overwriting original files. Then rename `WindowsPlayer.exe` to `VoxelTycoon.exe`. After that, Unity can be uninstalled. -->

!!! important
    If the Unity version used to build the game will change, you'll need to repeat this guide using correct version.

## Put the game itself into development mode

Open `VoxelTycoon_Data\boot.config` and add these strings:

```ini
wait-for-managed-debugger=1
player-connection-debug=1
```

## Attach a debugger

1. Rebuild your mod, and place `.dll` and `.pdb` files to your mod folder inside the game's `Content\` folder.
1. Now run the game and you should see a dialog saying *You can attach a managed debugger now if you want*.
1. In Visual Studio, go to *Debug* ➔ *Attach Unity Debugger*, then double-click an item in the dialog shown.

That's it! Now you able to set break points on your mod code, and inspect variable values.

!!! important
    The game running in the development mode will have reduced performance, so after you end with debugging your mod, you'll want to restore game files to the original state. To do so, just [verify integrity of game files](https://support.steampowered.com/kb_article.php?ref=2037-QEUH-3335).

    In this case (or with each game update) all the changes you made following this guide we'll be lost. To avoid this you can copy `UnityPlayer.dll`, `WinPixEventRuntime.dll`, `VoxelTycoon.exe`, and `VoxelTycoon_Data\boot.config` files into some backup folder, so you can copy it back later without need to install Unity again.

## Troubleshooting
* Ensure that *Project properties* ➔ *Build* ➔ *Advanced…* ➔ *Debugging information* is set to `Portable`.
* Ensure you have [Visual Studio Tools for Unity][1] installed.

[1]: https://docs.microsoft.com/en-us/visualstudio/gamedev/unity/get-started/getting-started-with-visual-studio-tools-for-unity