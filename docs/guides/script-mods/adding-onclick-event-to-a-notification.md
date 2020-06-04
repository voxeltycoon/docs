# Adding an OnClick-event to a Notification

!!! info
    This guide is authored by Voxel Tycoon community member **Nebruzias**.

## Introduction

This tutorial will guide you through the process of triggering an action whenever you click on a Notification.

After finishing this tutorial, you will know how to:

* Create a class with the INotificationAction Interface
* Add an action to your Notifications

!!! note
    This guide continues on [Creating your first script mod](/guides/script-mods/creating-your-first-script-mod).
    If you dont know how to setup the environment or how to get a mod in game, please follow this guide first.

    This guide is based on Visual Studio 2019 Community Edition

## Main Class

Start a new project and call it *"NotificationActionExample"*.

An unwritten rule in programming is that you give your variables, classes, methods, etc, clear names. They should be named in such a way so that
you know what their function is when you read their name.

As you might have noticed, when we created this project, the class inside the project is named *"Class1"* by default.

```csharp
namespace NotificationActionExample
{
    public class Class1
    {
    }
}
```

Obviously this is not a very clear name. Lets start with renaming *Class1* and give it the name *"Main"*. The reason for this name is that usually the
first class in your project will be your main class which manages and executes everything else. Of course you are free to call it whatever,
it is not required to be named *"Main"* for the mod to work, just make sure the name represents the function of this class.

To rename the class, right click on *Class1* in your Solution Explorer and select *Rename*.

![](/images/notification-action-tutorial/notification-action-tutorial-1.jpg)

Then type in *"Main"* and press enter.

!!! note
    After you have pressed enter, you are asked if you want to perform a rename for all references, select **Yes**.

Now we need to get access to callbacks which allows us to execute code at a certain point in the games lifecycle. To get access to these callbacks we need
to inherit from the `Mod`-class.

Where it says `public class Main`, change this to `public class Main : Mod`.

The `Mod`-class gives us access to a couple of callbacks. For this example we are interested in the `OnGameStarted()`-callback.

Inside your `Main`-class, add:

```csharp
protected override void OnGameStarted()
{
            
}
```

Now we can set up our notification inside `OnGameStarted()`, just like in the *"[Creating your first script mod](/guides/script-mods/creating-your-first-script-mod)"* guide.

Lets add the following code to `OnGameStarted()`:

   
```csharp
//Priority is an optional argument when calling the NotificationManager
NotificationPriority priority = NotificationPriority.Default;

//Color is an optional argument when calling the NotificationManager
//Beware, using Color can cause a small issue, read note below
Color color = Company.Current.Color;
string title = "Notification Action";
string message = "Click this notification to trigger a Notification Action";

//Lets use a bell as an icon
FontIcon icon = FontIcon.FaSolid("\uf0f3");
```

!!! note
    Instead of using `Color`, `string`, etc, you can also use the `var` type. Personally Im not a fan of `var`, but you are free to use it if you prefer using `var` instead.

    Unfortunately using `Color` instead of `var` can cause a small issue in this example. When we added the variable type `Color`, the namespace `System.Drawing` was 
    automatically added, since `Color` is part of this namespace. While `Company.Current.Color` does return a value of type `Color`, it is not part of the `System.Drawing` namespace,
    instead it belongs to the `UnityEngine` namespace. It is throwing an error because the value `Company.Current.Color` returns does not fit in `System.Drawing.Color`.

    There are 2 ways to fix this problem:

    * Replace `using System.Drawing;` with `using UnityEngine;`
    * If you can't replace/remove the `System.Drawing` namespace (because you might need it for something else), declare the color-variable like: `UnityEngine.Color color = Company.Current.Color;`

`NotificationManager.Current.Push()` requires 6 arguments:

1. Priority (Optional)
2. Color (Optional)
3. Title
4. Message
5. Action
6. Icon

We have set variables for all the arguments, except *Action*. Before we can create and set a variable for this argument, we have to create a new `Class`.

## NotificationAction Class

Lets create a new `Class`.

Right click on your project in your *Solution Explorer*, then go to *Add > New Item...*

![](/images/notification-action-tutorial/notification-action-tutorial-2.jpg)

Then in the next window select **Class** and give it the name *NotificationAction.cs* and click **Add**.

![](/images/notification-action-tutorial/notification-action-tutorial-3.jpg)

Once you have added this new class, follow the steps below:

1. Implement the `INotificationAction`-interface.
   
After you implemented the interface, your `NotificationAction`-class should now look like this: 
```csharp
class NotificationAction : INotificationAction
{
    public void Act()
    {
        throw new NotImplementedException();
    }

    public void Read(StateBinaryReader reader)
    {
        throw new NotImplementedException();
    }

    public void Write(StateBinaryWriter writer)
    {
        throw new NotImplementedException();
    }
}
```

!!! help
    [How to implement an interface?](https://docs.microsoft.com/en-us/visualstudio/ide/reference/implement-interface?view=vs-2019)

2. **(Optional)** Remove the `throw new NotImplementedException();` from all 3 callbacks, to prevent any exceptions showing up in game.
3. Lets add some code to the `Act()`-callback. This is the callback that will be triggered when you click on the linked notification. 
   As an action we are going to show another notification that tells us that we succesfully triggered a notification action.

    Lets set up a new notification:

    ```csharp
    //Priority is an optional parameter
    NotificationPriority priority = NotificationPriority.Default;

    //For a color, lets use a somewhat darker green - Make sure you're using the Color32 type, read below
    Color32 color = new Color32(63, 191, 63, 255);

    string title = "SUCCES!!!";
    string message = "You have succesfully triggered a notification action!";

    //Lets use a thumbs up as an icon
    FontIcon icon = FontIcon.FaSolid("\uf164");
    ```

!!! note
    The `Color32`-type accepts the full RGBA values (0 - 255), while the `Color`-type only accepts values from 0 to 1.
    When you have a RGB value you want to use, it is recommended to use the `Color32`-type, else you have to convert your RGB values
    to a value between 0 and 1. This is not difficult to do, but it requires a bit of extra work which can be avoided.

Then we need to call the **Notification Manager** to actually display this notification. We do this with adding the following statement:

`NotificationManager.Current.Push(priority, color, title, message, null, icon);`

!!! note
    `INotificationAction action` is a required argument while calling `NotificationManager`. Since we dont have an action
    we want to happen when this notification is clicked, we just pass `null` for this argument.

As a final result your `NotificationAction`-class should now look like this:

```csharp hl_lines="17"
class NotificationAction : INotificationAction
{
    public void Act()
    {
        //Priority is an optional parameter
        NotificationPriority priority = NotificationPriority.Default;

        //Color is an optional parameter
        Color32 color = new Color32(63, 191, 63, 255);

        string title = "SUCCES!!!";
        string message = "You have succesfully triggered a notification action!";

        //Lets use a thumbs up as an icon
        FontIcon icon = FontIcon.FaSolid("\uf164");

        NotificationManager.Current.Push(priority, color, title, message, null, icon);
    }

    public void Read(StateBinaryReader reader)
    {
           
    }

    public void Write(StateBinaryWriter writer)
    {
            
    }
}
```

Now that we have a class which can go in the `INotificationAction action`-variable, we can implement it.

## Implement the Notification Action

Add the following line to your `OnGameStarted()`-callback in your `Main`-Class: 

`INotificationAction action = new NotificationAction();`

Your `Main`-class should now look like this:

```csharp hl_lines="16"
public class Main : Mod
{
    public void OnGameStarted()
    {
        //Priority is an optional parameter
        NotificationPriority priority = NotificationPriority.Default;
        //Color is an optional parameter
        Color color = Company.Current.Color;

        string title = "Notification Action";
        string message = "Click this notification to trigger a Notification Action";

        //Lets use a bell as an icon
        FontIcon icon = FontIcon.FaSolid("\uf0f3");

        INotificationAction action = new NotificationAction();
    }
}
```

Now we have all the required arguments to call the **Notification Manager**.

Add the following statement to your `OnGameStarted`-callback in your `Main`-Class:

`NotificationManager.Current.Push(priority, color, title, message, action, icon);`

As a final result your `Main`-class should look like this:

```csharp hl_lines="18" 
public class Main : Mod
{
    public void OnGameStarted()
    {
        //Priority is an optional parameter
        NotificationPriority priority = NotificationPriority.Default;
        //Color is an optional parameter
        Color color = Company.Current.Color;

        string title = "Notification Action";
        string message = "Click this notification to trigger a Notification Action";

        //Lets use a bell as an icon
        FontIcon icon = FontIcon.FaSolid("\uf0f3");

        INotificationAction action = new NotificationAction();

        NotificationManager.Current.Push(priority, color, title, message, action, icon);
    }
}
```

## Compile and run the mod

Now we can add this mod to the game and try it out.

!!! tip
    To read in detail how to do this, check [Run the mod](/guides/script-mods/creating-your-first-script-mod/#run-the-mod) section of the [Creating your first script mod](/guides/script-mods/creating-your-first-script-mod) guide.

Follow the steps below:

1. Build your project into a .dll-file
2. Locate your .dll-file and place it in `/voxel-tycoon/content/<your_mod_folder>`
3. Create a [mod.json file](/guides/how-to-publish-your-mod/#set-custom-title-and-description)
4. Start Voxel Tycoon and start a new game with your just created mod activated
5. Wait for your game to load...
6. **CLICK THAT NOTIFICATION!!!**

## Play around

If you're not yet very familiar with coding, I suggest to play around some more to see what other awesome things you can do with
*Notification Actions*. This is a good way to get better with coding.