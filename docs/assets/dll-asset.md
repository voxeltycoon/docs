# .dll asset

## Description

Since [0.79](//voxeltycoon.xyz/changelog#0.79) you can create not only content-based mods but also mods that provide new behaviors and logic, or modify already existent ones. We call them **script mods**.

## How it works

`.dll` asset is treated by the game as any other mod asset, so when you place it in your mod folder, the game will find and load it. However, the process of creating the DLL file itself differs greatly from the other assets.

### Core concepts

- The DLL file you want to get in the end essentially is a [.NET class library](https://docs.microsoft.com/en-us/dotnet/core/tutorials/library-with-visual-studio?tabs=csharp) targeting **.NET Standard 2.0** (or .NET 4.x) and containing one or more implementations of the [`Mod`](/documentation/VoxelTycoon/Modding/Mod) interface provided by Voxel Tycoon API.
- In order to access Voxel Tycoon and Unity APIs you need to reference `Assembly-CSharp.dll` and `UnityEngine.CoreModule.dll` libraries that can be found in `VoxelTycoon_Data/Managed` directory inside the game folder.
- Also, you might want to reference `UnityEngine.UI.dll` if you want to work with the game UI.
- After you compile your library, the resulted .dll file is ready to be put into your mod directory and loaded by the game.

### Step-by-step tutorial

In order to help you start working with the concepts described above, we compiled a simple [step-by-step tutorial](/guides/script-mods/creating-your-first-script-mod/) which will guide you through the process of creating your first script mod for Voxel Tycoon.

## FAQ

### What can be done with the script mods?

Voxel Tycoon works on top of Unity, and script mods have full access to all the features that Unity runtime provides, as well as Voxel Tycoon APIs. In other words, you can do anything that you can normally do with Unity runtime at least.

### In what language mods can be written?

Since the game is written in C# and works on top of Unity (which primary language is also C#), most examples, tutorials, and docs you may find will use this language. That being said, **C# recommended language of choice for the script mods**. C# is a modern, constantly evolving language that provides a huge variety of features and flexibility.

However, any [.NET language](https://en.wikipedia.org/wiki/List_of_CLI_languages) will work.

### Where's API documentation?

The documentation for Voxel Tycoon API is being created [here](/reference/). Still, **we urge you to start creating script mods right now**, so we can build an extendable, flexible, and well-featured platform together with you.

Just as you feel that you need any new APIs, events, callbacks, etc - or modifications of existing ones - do not hesitate to let us know by creating an issue on [suggestion tracker](https://github.com/voxeltycoon/suggestions/issues). Also, feel free to chat with us and community directly on our [Discord Server](//discord.gg/voxeltycoon).

We are committed to update and extend the modding APIs along with your requests as soon as possible.

Meanwhile, we suggest you to use decompilers such as [dnSpy](https://github.com/0xd4d/dnSpy) or [JetBrains dotPeek](https://www.jetbrains.com/decompiler/) to dig into the game's code and start exploring the possibilities for modification. Also, we've [hosted a repository](https://github.com/voxeltycoon/mods) with the source code of our official mods and samples.
