# .patch asset

## Description

This type of asset allows you to apply changes to assets located in any other mod, including the base game content.

## How it works

Every `.patch` asset consists of a list of *commands*.

Each command defines which operation should be applied to what asset, and also specifies arguments specific to that command.

An example patch that adds custom made peyotes to the desert biome from the base game:

```json
{
    "Commands": [
        {
            "Command": "Add",
            "TargetAssetUri": "base/desert.biome",
            "Path": "Plants",
            "Values": [
                {
                    "Uri": "plants-o-plenty/peyote.plant",
                    "Probability": 0.02
                }
            ]
        }
    ]
}
```

## Available commands

### Add

Adds provided values to a collection at the path.

| Argument | Description |
| --- | --- |
| **TargetAssetUri** : *string* | The [URI](/concepts/asset-uri) of the target asset. |
| **Path** : *string* | [JsonPath](https://goessner.net/articles/JsonPath/) to a collection (or collections) where values should be added. |
| **Values** : *array* | Values to add. |

### Set

Sets provided value to a property at the path.

| Argument | Description |
| --- | --- |
| **TargetAssetUri** : *string* | The [URI](/concepts/asset-uri) of the target asset. |
| **Path** : *string* | [JsonPath](https://goessner.net/articles/JsonPath/) to a property (or properties) which value should be set. |
| **Value** : *any* | Value to be set. |

### Remove

Removes value at the path.

| Argument | Description |
| --- | --- |
| **TargetAssetUri** : *string* | The [URI](/concepts/asset-uri) of the target asset. |
| **Path** : *string* | [JsonPath](https://goessner.net/articles/JsonPath/) to a value (or values) which should be removed. |

### Merge

Merges provided object with an object at the path (as described [here](https://www.newtonsoft.com/json/help/html/MergeJson.htm)).

| Argument | Description |
| --- | --- |
| **TargetAssetUri** : *string* | The [URI](/concepts/asset-uri) of the target asset. |
| **Path** : *string* | [JsonPath](https://goessner.net/articles/JsonPath/) to an object (or objects) where provided object should be merged. |
| **Value** : *object* | Object to be merged. |
| **ArrayHandling** : *string* | One of the values described [here](https://www.newtonsoft.com/json/help/html/T_Newtonsoft_Json_Linq_MergeArrayHandling.htm).<br>*Optional* (default: `"Concat"`) |
| **NullValueHandling** : *string* | One of the values described [here](https://www.newtonsoft.com/json/help/html/T_Newtonsoft_Json_Linq_MergeNullValueHandling.htm).<br>*Optional* (default: `"Merge"`) |

## Optional flag

Sometimes, you might want to alter assets which presence is not known in advance. Luckily, since [0.78](https://voxeltycoon.xyz/changelog#0.78), each command supports the new `Optional` flag. When set to `true`, in case the target asset was not found, a command will be just skipped without failing.

## Debugging

You can actually see how target assets look after all patches are applied to them. To do so, open the Settings window while holding <kbd>SHIFT</kbd>, then navigate to *Misc* tab and toggle *Write patched assets* setting (at the bottom).

Now, every time you load or start a new game with your mod enabled, the game will write target assets in their final form (with all patches applied) to `<original_filename>.patched.json`.

Don't forget to remove those files before publishing your mod, and disable this option after debugging is completed to avoid the additional performance cost.

## Advanced path examples

!!! tip "Pro Tip"   
    You can use online JSONPath evaluators like https://jsonpath.com/ to test complex pathes.

Find property of an object in an array by index:

`ItemsPerDay[0].CountMultiplier`

Find property of all objects in an array:

`ItemsPerDay[*].CountMultiplier`

Find property of an objects in an array which has specific value on property:

`ItemsPerDay[?(@.Uri=='base/tv.item')].CountMultiplier`

`ItemsPerDay[?(@.CountMultiplier>0.5)].CountMultiplier`