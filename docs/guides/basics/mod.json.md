---
title: mod.json
---

`mod.json` contains the metadata for your mod allowing the game to see it and prepare it for publishing. The file should be placed to the root of your mod's folder.

## Minimal required structure

```json
{
    "Title" : "My first mod",
    "Description" : "And that's my first mod description",
    "Tags": [ "Tag1", "Tag2" ]
}
```

## Properties

| Property | Description |
| - | - |
| Title | Used only when publishing a new Steam mod. To change a title for an already published mod, use Steam Workshop Dashboard for your item. |
| Description | Used only when publishing a new Steam mod. To change a description for an already published mod, use Steam Workshop Dashboard for your item. |
| Tags | An array of Steam Workshop tags. For the list of available tags check the [Workshop page](https://steamcommunity.com/app/732050/workshop/). |
| Dependencies | An array of [dependencies](/guides/basics/dependencies/). Used only for local testing. To set up dependencies for a published mod, use Steam Workshop Dashboard for your item. |
| PublishedFileId | After uploading mod to Steam, `PublishedFileId` property will be added to your `mod.json`. It's the ID of your mod on Steam (you can see it in the mod's Workshop page url). This way, the game knows a relation between your local mod and the published one. Don't remove this property, or you won't be able to update your mod until you add it back. |


!!! tip
    If you have lost your local copy of the mod you can always download mod files from the Workshop and re-add `PublishedFileId` manually to the `mod.json`.