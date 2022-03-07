---
title: mod.json
---

`mod.json` is a mod metadata allowing the game to see and propery display your mod in the mod window. It should be located in the root of your mod folder.

## Minimal required structure

```json
{
    "Title" : "My first mod",
    "Description" : "And that's my first mod description",
    "Tags": [ "Tag1", "Tag2" ]
}
```

For the list of available tags check the [Workshop page](https://steamcommunity.com/app/732050/workshop/).

## PublishedFileId

After uploading mod to Steam, `PublishedFileId` property will be added to your `mod.json`. It's the ID of your mod on Steam (you can see it in the mod's Workshop page url). This way, the game knows relation between your local mod and the published one. Don't remove this property, or you won't be able to update your mod until you add it back.

If you for some reason lost your local copy of the mod you can always download mod files from the Workshop and re-add `PublishedFileId` manually to the `mod.json`.