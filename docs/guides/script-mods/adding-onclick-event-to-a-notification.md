# Adding an OnClick-event to a Notification

## Introduction

This tutorial will guide you through the process of triggering an action whenever you click on a Notification.

After finishing this tutorial, you will know how to:

* Create a class with the INotificationAction Interface
* Add an action to your Notifications

>This guide continues on [Creating your first script mod](/guides/script-mods/creating-your-first-script-mod).
>If you dont know how to setup the environment or how to get a mod in game, please follow this guide first.

>This guide is based on Visual Studio 2019 Community Edition

## Main Class

Lets start with renaming *Class1*.

Right click on *Class1* in your Solution Explorer and select *Rename*.

![](/images/notification-action-tutorial/notification-action-tutorial-1.jpg)

Then type in *"Main"*

>After you have pressed enter, you are asked if you want to perform a rename for all references, select **Yes**.

Now we can set up our notification, just like in the *"[Creating your first script mod](/guides/script-mods/creating-your-first-script-mod)"* guide.

Follow these steps:

1. Implement the `IMod`-interface.
2. **(Optional)** Remove the `throw new NotImplementedException();` from all 4 callbacks, to prevent any exceptions showing up in game.
3. Lets add some code to the `OnGameLoaded()` callback
   
   ```csharp
    //Priority is an optional parameter
    NotificationPriority priority = NotificationPriority.Default;

    //Color is an optional parameter - this can cause a small issue, read below
    Color color = Company.Current.Color;

    string title = "Notification Action";
    string message = "Click this notification to trigger a Notification Action";

    //Lets use a bell as an icon
    FontIcon icon = FontIcon.FaSolid("\uf0f3");
    ```


    >You can also use the `var` type. Personally Im not a fan of `var`, but you are welcome to use it if you prefer using `var` instead.
    >
    >Unfortunately nót using the `var` type can cause a small issue in this example. When adding the variable type `Color` the namespace `System.Drawing` is 
    >added automatically, while `Company.Current.Color` returns a type `Color` which is part of the `UnityEngine` namespace.
    >
    >There are 2 ways to fix this problem:
    >* Replace `using System.Drawing;` with `using UnityEngine;`
    >* If you can't replace/remove the `System.Drawing` namespace declare the color-variable like: `UnityEngine.Color color = Company.Current.Color;`

For the actual `INotificationAction action`-variable we need to create a new class.

## NotificationAction Class

Right click on your project in your *Solution Explorer*, then go to *Add > New Item...*

![](/images/notification-action-tutorial/notification-action-tutorial-2.jpg)

Then in the next window select **Class** and give it the name *NotificationAction.cs* and click **Add**.

![](/images/notification-action-tutorial/notification-action-tutorial-3.jpg)

Once you have added this new class, follow the steps below:

1. Implement the `INotificationAction`-interface in the same fashion as you implemented the `IMod`-interface in the `Main`-class.
   
    Your `NotificationAction`-class should now look like this: 
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

2. **(Optional)** Remove the `throw new NotImplementedException();` from all 3 callbacks, to prevent any exceptions showing up in game.
3. Lets add some code to the `Act()` callback. This is the callback that will be triggered when you click on the linked notification.
    As an action we are going to show a new notification that lets us know that we succesfully triggered a notification action.
    So, lets set up a new notification.

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

>The `Color32`-type accepts the full RGBA values (0 - 255), while the `Color`-type only accepts values from 0 to 1.
>When you have a RGB value you want to use, it is recommended to use `Color32`, else you have to convert your RGB values
>to a value between 0 and 1. This is not difficult to do, but it requires a bit of extra work which can be avoided.

Then we need to call the **Notification Manager** to actually display this notification. We do this with adding the following statement:

`NotificationManager.Current.Push(priority, color, title, message, null, icon);`

>`INotificationAction action` is a required argument while calling `NotificationManager`. Since we dont have an action
>we want to happen when this notification is clicked, we just pass `null` for this argument.

As a final result your `NotificationAction`-class should now look like this:

```csharp
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

<br>

Now that we have a class which can go in the `INotificationAction action`-variable, we can implement it.

## Implement the Notification Action

Add the following line to your `OnGameLoaded`-callback in your `Main`-Class: 

`INotificationAction action = new NotificationAction();`

Your `Main`-class should now look like this:
```csharp
public class Main : IMod
{
    public void OnBeforeGameLoad()
    {
          
    }

    public void OnGameLoaded()
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

    public void Read(StateBinaryReader reader)
    {
           
    }

    public void Write(StateBinaryWriter writer)
    {

    }
}
```

<br>

Now we have all the required arguments to call the **Notification Manager**.

Add the following statement to your `OnGameLoaded`-callback in your `Main`-Class:

`NotificationManager.Current.Push(priority, color, title, message, action, icon);`

As a final result your `Main`-class should look like this:
```csharp
public class Main : IMod
{
    public void OnBeforeGameLoad()
    {
          
    }

    public void OnGameLoaded()
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

    public void Read(StateBinaryReader reader)
    {
           
    }

    public void Write(StateBinaryWriter writer)
    {

    }
}
```

<br>

## Compile and run the mod

Now we can add this mod to the game an try it out.

To read in detail how to do this, read [Creating your first script mod](/guides/script-mods/creating-your-first-script-mod) - **Run the mod**.

Follow the steps below:

1. Build your project into a .dll-file
2. Locate your .dll-file and place it in `/voxel-tycoon/content/<your_mod_folder>`
3. Create a [mod.json file](/guides/how-to-publish-your-mod)
4. Start Voxel Tycoon and start a new game with your just created mod activated
5. Wait for your game to load...
6. **CLICK THAT NOTIFICATION!!!**

## Play around

If you're not yet very familiar with coding, I suggest to play around some more to see what other awesome things you can do with
*Notification Actions*. This is a good way to get beter with coding.