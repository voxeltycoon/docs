# Creating your first script mod

## Introduction

This tutorial will guide you through the process of creating your first script mod for Voxel Tycoon.

To get a common understanding of how script mods work and what is possible to be done with them, please refer [.dll asset documentation page](/assets/dll-asset).

We assume that you have at least basic knowledge of development in C# and Unity.

After finishing this tutorial, you will know how to:

* Setup development environment
* Build super simple but working script mod that shows custom in-game notifications

!!! tldr
    Resulting source code, with some additions, can be found here: https://github.com/voxeltycoon/mods.

## Set up the environment

Script mods can be built with any tools that could compile your source code into the .NET DLL. This ranges from full-featured IDEs like Visual Studio, to manually calling the compiler on source files.

In this tutorial, we will use **Visual Studio (Community 2019)** for this purpose, as the most straightforward way to build a .NET DLL on Windows. It can be obtained for free from the [official site](https://visualstudio.microsoft.com/vs/).

Ensure that you have *.NET Desktop development* workload installed:

![](/images/dll-mod-tutorial/dll-mod-tutorial-2-1.png)

Besides Visual Studio, you'll need - obviously - a licensed copy of [Voxel Tycoon](//voxeltycoon.xyz/buy) to test and [publish your mods](https://voxeltycoon.xyz/publish_your_mod).

Actually, this concludes all the preparations you need to start developing your first script mod. As you may notice, even Unity installation is not required.

## Create a new project

After you launch Visual Studio, you'll see the welcome window. Hit *Create new project* there:

![](/images/dll-mod-tutorial/dll-mod-tutorial-1.png)

Then choose *Class Library (.NET Standard)* (make sure you choose C# one, not Visual Basic):

![](/images/dll-mod-tutorial/dll-mod-tutorial-2.png)

Name your project and choose where it should be placed (this is where your source code will be located, not the result DLL file,  so **DO NOT** choose game's `Content` folder):

![](/images/dll-mod-tutorial/dll-mod-tutorial-3.png)

Now, we need to add references to libraries that contain APIs we want to access. To do this, right-click on the project dependencies item in the *Solution Explorer* (1), then click on *Add Reference...* (2):

![](/images/dll-mod-tutorial/dll-mod-tutorial-4.png)

*Reference Manager* window will appear. Hit *Browse* on the left (1) then *Browse* at the bottom (2) and select `Assembly-CSharp.dll` and `UnityEngine.CoreModule.dll` libraries that can be found in `VoxelTycoon_Data/Managed` directory inside the game folder (3):

![](/images/dll-mod-tutorial/dll-mod-tutorial-5.png)

The project for our mod is ready! Now it's time to make it do something.

## Write some code

As a simple but working example let's make our mod to show a custom in-game notification when the game is loaded.

### Inherit from the `Mod` abstract class

To let the game know what code it should run from our script mod, we need to [inherit](https://docs.microsoft.com/en-us/dotnet/csharp/tutorials/inheritance) from the `Mod` class, situated at the `VoxelTycoon.Modding` namespace.

`Mod` class exposes several callbacks, but for our mod it's enough to [override](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/override) just `OnGameStarted` one:

```csharp
    public class Class1 : Mod
    {
        protected override void OnGameStarted()
        {
            // That's where our mod logic goes.
        }
    }
```

### Access Notification Manager API

To show our notification in-game, we need to access **Notification Manager**. Besides other methods it exposes, the most we interested in currently is this one:

```csharp
public Notification Push(NotificationPriority priority,
    Color color,
    string title,
    string message,
    INotificationAction action,
    FontIcon icon)
```

Let's call it from our mod's code:

```csharp
protected override void OnGameStarted()
{
    // Maximum priority so we never miss it.
    var priority = NotificationPriority.Critical;

    // Make the notification look fancy by setting the color
    // to the current company color.
    var color = Company.Current.Color;

    var title = "Hello World!";
    var message = "Oh gosh, this is my first ever C# mod " +
    "for VT, and it's actually working for some reason!";

    // Action is executed when player clicks on notification.
    // For the sake of simplicity, we will not cover notification
    // actions in this tutorial, so we just pass default value (null),
    // which effectively means no action will be executed on click.
    var action = default(INotificationAction);

    // Use custom FontAwesome (https://fontawesome.com/icons) icon
    var icon = FontIcon.FaSolid("\uf7e4");

    // And finally, call the API
    NotificationManager.Current.Push(priority,
        color,
        title,
        message,
        action,
        icon);
}
```

!!! info
    There's a lot of managers present around the code of Voxel Tycoon. Most of the game API is accessable through them.

!!! tip
    You can create your own managers by inheriting from `Manager<T>` or `LazyManager<T>` classes.

## Run the mod

That's it! Our brilliant mod is almost ready to be put in the game.

### Compile the mod into a DLL

Now we need to compile our source code to a DLL file that can be put into the game. To do this, just hit <kbd>F6</kbd>. Yeah, that easy!

After the build process successfully finishes, you will find the result DLL at the `<project location>/bin/Debug/netstandard2.0/<project name>.dll` directory.

!!! note
    Depending on chosen [build configuration](https://docs.microsoft.com/en-us/visualstudio/debugger/how-to-set-debug-and-release-configurations?view=vs-2019), the DLL may be built to `Release` directory instead of `Debug`. 

### Run the game

As we now have a DLL, we can put it into the game. Just copy the DLL to your mod directory inside the game's `Content` folder, just as you do with any other mod asset. Now you can run VT, and start the new game with your mod enabled.

!!! note
    Don't forget to put a [`mod.json` metadata file](/guides/basics/mod.json) inside the mod pack folder which will allow the game to locate and load the mod.

!!! tip
    To avoid manual copying the DLL file after every change, you can setup [post-build event](https://docs.microsoft.com/en-us/visualstudio/ide/how-to-specify-build-events-csharp?view=vs-2019) in the project settings.

## Enjoy yourself

Congratulations! You've just created such an amazing mod, just as you are! ✨

As a conclusion, take a look at some points that were left outside of the scope of this tutorial:

* One DLL can contain not just one code file, but any amount you need
* Explore other callbacks `Mod` class provides, like `OnUpdate()` or `Initialize()` (called before any assets loaded)
* Mods can read and write data to a save file using corresponding callbacks
* You can debug your code by [writing logs](/guides/script-mods/debugging/writing-logs) or even [attaching a debugger](/guides/script-mods/debugging/attaching-a-debugger)
* As stated at [Where's API documentation?](/assets/dll-asset/#wheres-api-documentation), feel free to explore the game code base for existent and possible APIs, and let us know what you think!

Happy coding! 💜
