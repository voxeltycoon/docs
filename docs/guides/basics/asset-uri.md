# Asset URI

**Asset URI** is a unique identifier of the asset. It, in particular, used to reference one asset from another.

URIs are automatically inferred from mod pack directory and asset file names.

## Structure

It always has the next structure: `<modpack>/<asset_name>.<asset_extension>`.

For example, `base/tree.plant`, `your_first_mod/house_2.obj`, or `base/desert.biome`.

## File hierarchy

The actual file hierarchy in a mod pack has no effect on the produced URI. Eg. it doesn't matter if target asset is located at `Content/base/desert.biome` or `Content/base/biomes/desert.biome`, the result URI will be the same: `base/desert.biome`.

This effectively means that you can't have two assets with the same file names in one mod pack.

!!! warning "URIs are always lowercased"
    Even if the target asset has a non-lowercased name (eg. **TeslaModelS3.spaceship** in mod pack **ElonMusk**) its URI still will be `elonmusk/teslamodels3.spaceship`. `ElonMusk/TeslaModelS3.spaceship` URI will not work.