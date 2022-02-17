# How to publish your mod

!!! note
    This guide is for version  `0.87`.

## Introduction

This step-by-step guide is intended for mod creators who want to feature their creations on the [Steam Workshop](https://steamcommunity.com/app/732050/workshop/) and the in-game Mod Gallery. Like this:

![](/images/how-to-publish-your-mod/mod-browser.png)

!!! check "EULA"
    Please ensure that you have read and agreed with our [EULA](//voxeltycoon.xyz/eula) before publishing mods.

## Prepare mod for publishing

### Add preview image

Take a screenshot of your mod in action, and save it as `preview.png`. Drop the image into your mod's root folder. It should be square and its dimensions should be at least `512x512` pixels.

### Set custom title and description

Create a new `.txt` file, rename it to `mod.json`, and place it in your mod's root folder. Its contents should be set up as follows:

```json
{
    "Title" : "My awesome mod",
    "Description" : "This mod contains some cool stuff!",
    "Tags": "[Tag], [Another Tag?]"
}
```
For more information on available tags, check [mod.json](/guides/basics/mod.json) page.

## Publish, update, and unpublish

Just scroll to your mod, and choose the appropriate action.

![](/images/how-to-publish-your-mod/publish-mod.png)

!!! note
    You can publish only mods that are not tracked as **installed**, i.e. was not downloaded from the gallery but manually placed to `Content/` by you.

If you are updating a mod that is already published, users that have it installed, Steam should download it automatically upon game launch.
