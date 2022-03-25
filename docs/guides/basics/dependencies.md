# Mod dependencies

If your mod depends on some other mod or mods, you can explicity state it. This will serve two purposes:

* When a player subscribes to your mod, Steam will suggest to subscribe to other mods which your mod depends on
* The game will ensure that those mods are loaded prior your mod

## Setting up dependcies

Use Steam Workshop Dashboard to set up dependencies. Go to your item page, and click *Add/Remove Required Items* under the *Owner Controls*.

## Local testing

To test dependency configuration on local machine, you can list dependendencies in the `mod.json`:

```json
"Dependencies" : [ "my_common_assets", 2376260968 ]
```

String values are refer to local mods, and numbers are refer to published mods (you can find a published mod's id in its Steam page url).

## Soft/hard dependencies

Currently, all dependencies are soft. This means that if a mod on which your mod depends has not found, the game will try to load your mod anyway.

