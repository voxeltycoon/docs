# Item groups

Item groups associate items (e.g. coal, sand, TVs, etc.) with storage (vehicles, warehouses) without having to list all supported items in each storage. This makes mod compatibility easier and eliminates the need for compatibility patches.

 Additionally, it standardizes the representation of similar items in the game, making it more predictable for players.

If your mod adds new items or storage assets (vehicles or warehouses), it's recommended to update them to utilize item groups.

## Update item assets

1. Set your item as belonging to one of [available item groups](#built-in-groups) using the new `ItemGroupUri` property.
2. Set meshes used to display an item in different kind of storages using `MeshUris` property (keys are [mesh tags](#mesh-tags)).

``` json
{
    "ItemGroupUri": "base/bulk.itemgroup",
    "MeshUris": {
        "vehicle_heap": "base/gravel_item_heap.obj"
    },
    // ...
}
```

## Update storage assets

!!! note
    Different capacity, resolution, or spacing settings per item aren't supported by this approach. If it's essential for your mod, you should stick to using `Items` property.

    By the way, you can mix both approaches.


### `.storages`

1. List desired item groups in the `ItemGroupUris` array.
2. Set `Items` property to `null`.

``` diff
{
-   "Items": {
-        "base/sand.item": null,
-        "base/gravel.item": null,
-   },
+   "Items": null,
+   "ItemGroupUris": [
+       "base/bulk.itemgroup"
+   ],
    // ...
}
```

### `.passengerstorages`

1. List desired item groups in the `ItemGroupUris` array.
2. Move `Capacity` settings to the root.
3. Set `Items` property to `null`.

``` diff
{
-   "Items": {
-        "base/passenger.item": {
-           "Capacity": 30,
-            // ...
-       }
-   },
+   "Items": null,
+   "Capacity": 30,
+   "ItemGroupUris": [
+       "base/passenger.itemgroup"
+   ],
    // ...
}
```

### `.stackstorages`

1. List desired item groups in the `ItemGroupUris` array.
2. Move essentinal `Capacity`, `Resolution`, and `Spacing` settings to the root (if set to `null`, they will be calculated automatically).
3. Set `MeshTag` property to [`default`](#mesh-tags).
4. Set `Items` property to `null`.

### `.heapstorages`

1. List desired item groups in the `ItemGroupUris` array.
2. Move essentinal `Capacity`, `Resolution`, and `Spacing` settings to the root (if set to `null`, they will be calculated automatically).
3. Set `MeshTag` property to [`vehicle_heap`](#mesh-tags).
4. Set `Items` property to `null`.

## Built-in groups

<table>
   <tr>
        <th>URI</th>
        <th>Items</th>
    </tr>
    <tr>
    <td>base/bulk.itemgroup</td>
    <td>
        <img src="/images/items/gravel.png">
        <img src="/images/items/sand.png">
    </td>
    </tr>
    <tr>
        <td>base/general.itemgroup</td>
        <td>
            <img src="/images/items/advanced_furniture.png">
            <img src="/images/items/advanced_wood_frame.png">
            <img src="/images/items/circuit.png">
            <img src="/images/items/copper_wire.png">
            <img src="/images/items/furniture.png">
            <img src="/images/items/glass_pane.png">
            <img src="/images/items/glass_tube.png">
            <img src="/images/items/iron_parts.png">
            <img src="/images/items/iron_plate.png">
            <img src="/images/items/radio.png">
            <img src="/images/items/tv.png">
            <img src="/images/items/vacuum_tube.png">
            <img src="/images/items/wood_frame.png">
      </td>
    </tr>
    <tr>
        <td>base/long_general.itemgroup</td>
        <td>
            <img src="/images/items/concrete_beam.png">
            <img src="/images/items/reinforced_concrete_beam.png">
            <img src="/images/items/steel_beam.png">
            <img src="/images/items/wood_beam.png">
            <img src="/images/items/wood_log.png">
            <img src="/images/items/wood_plank.png">
        </td>
    </tr>
    <tr>
        <td>base/mail.itemgroup</td>
        <td>
            <img src="/images/items/mail.png">
        </td>
    </tr>
    <tr>
        <td>base/open_bulk.itemgroup</td>
        <td>
            <img src="/images/items/coal.png">
            <img src="/images/items/copper_ore.png">
            <img src="/images/items/iron_ore.png">
        </td>
    </tr>
    <tr>
        <td>base/open_general.itemgroup</td>
        <td>
            <img src="/images/items/copper_bar.png">
            <img src="/images/items/iron_bar.png">
            <img src="/images/items/steel_bar.png">
            <img src="/images/items/stone.png">
            <img src="/images/items/stone_brick.png">
        </td>
    </tr>
    <tr>
        <td>base/passenger.itemgroup</td>
        <td>
            <img src="/images/items/passenger.png">
        </td>
    </tr>
</table>

The next item groups are not used in the base game yet, but already can be utilized by mods.

<table>
   <tr>
        <th>URI</th>
        <th></th>
    </tr>
    <tr>
        <td>base/dangerous_liquid.itemgroup</td>
        <td></td>
    </tr>
    <tr>
        <td>base/expensive.itemgroup</td>
        <td></td>
    </tr>
    <tr>
        <td>base/liquid.itemgroup</td>
        <td></td>
    </tr>
    <tr>
        <td>base/perishable.itemgroup</td>
        <td></td>
    </tr>
</table>

!!! example "Feedback wanted"
    You can share your suggestions for additional item categories to be included in the base game via [Discord](//discord.gg/VoxelTycoon).

## Mesh tags

Mesh tags are used to define what mesh should be used to display an item inside an open storage.

Base game provides the next mesh tags:

| Mesh tag | Storage | Description |
| --- | --- | --- |
| default | `.stackstorages` | Used to display items in stacks |
| vehicle_heap | `.heapstorages` | Used to display items as heap inside vehicles |