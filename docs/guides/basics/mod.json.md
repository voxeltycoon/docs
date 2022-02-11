---
title: mod.json
---

`mod.json` is a mod metadata allowing the game to see and propery display your mod in the mod window. It should be located in the root of your mod folder.

## Structure

```json
{
    "Title" : "My first mod",
    "Description" : "And that's my first mod description",
    "Tags": "[Tag], [Another Tag]"
}
```

Available tags:

     Industries
     Researches
     Biomes
     Gameplay
     Utils
     Visuals
     Other

Vehicles

     Steam locomotives
     Diesel locomotives
     Electric locomotives
     Passenger wagons
     Gasoline trucks
     Diesel trucks
     Gasoline buses
     Diesel buses
     Other vehicles

Buildings

     Factories
     Houses
     Rails
     Roads
     Stations
     Decorations
     Other Buildings

## PublishedFileId

Also, after uploading mod to Steam, there will reside a property called `PublishedFileId`. It's used to tie your local mod with exact Steam Workshop mod and allows you to update it.

If you for some reason lost your local copy of the mod, you can always download it from workshop and add corresponding property to the `mod.json`, so the game knows to what Workshop mod this local copy is tied.
