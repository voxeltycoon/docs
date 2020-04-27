# Creating your first truck mod

!!! info
    This guide is authored by Voxel Tycoon community member **scailman**.

## Introduction

In this guide, we will see how to configure a truck with different types of loads and trailers.

Basic knowledge of 3d design software is required as this guide will not cover the design part of the truck, only how to configure it to work properly in Voxel Tycoon.

![](/images/truck-mod-tutorial/image2.png)

The following will explain each type of asset that a truck uses, how to configure the different cargo types, and how to configure trailers and semi-trailers.


## Prepare a model for export

Trucks, like trains, have several parts that must be positioned on the coordinate axis at `0,0,0` and exported independently.
To learn how to texture the model, read the [Creating your first building](/guides/content-mods/creating-your-first-building-mod/) guide where the process is explained in detail.

![](/images/truck-mod-tutorial/image8.png)

This image shows the chassis position and both wheels, one single and one double.

!!! important
    Like trains, trucks should also be facing the front to the right in the right viewport (Blender loads vehicles facing left), otherwise, the truck will appear in the wrong direction on the road.

Once we have the chassis, and the wheels are textured and positioned correctly, we can explore each model in .obj format.

## Wheels (`.caraxle` asset)

All road vehicles must have a minimum of two axles, one for the front wheels and one for the rear.
If the model we are making is a trailer or semi-trailer, the front axle must exist but it doesn't have to be a visible wheel.
The `.caraxle` asset has only two parameters and is as shown below:

```json
{
  "WheelMeshUri": "scm_truck_pack/single_wheel.obj",
  "WheelRadius": 0.162
}
```

* **WheelMeshUri**: Specifies the path of the wheel's .obj file. If we don't want it to have a mesh, this parameter will be null.
* **WheelRadius**: Specifies the radius of the wheel that we can obtain from the 3d program. This value is important because if it is greater the wheel will appear overlapping the road and if it is less, the wheel will float above the road.

## Truck configuration (`.carunit` asset)

The configuration of a truck is very similar to the configuration of a locomotive, only differing in the certain parameters specific to road vehicles vary.

```json
{
  "Axles": [
    {
      "Uri": "scm_truck_pack/single_wheel.caraxle",
      "Offset": 0.545,
      "HalfTrack": 0.344,
      "Steered": true
    },
    {
      "Uri": "scm_truck_pack/double_wheel.caraxle",
      "Offset": -0.578,
      "HalfTrack": 0.278,
      "Steered": false
    }
  ],
  "AudioUri": "base/truck.caraudio",
  "Type": "Diesel",
  "Length": null,
  "VelocityLimit": 85.0,
  "Power": 170.0,
  "Weight": 4.2,
  "Price": null,
  "PriceMultiplier": null,
  "RunningCosts": null,
  "RunningCostsMultiplier": null,
  "Liveries": [
    {
      "MeshUri": "scm_truck_pack/hopper_truck.obj"
    }
  ],
  "Coupling1Uri": null,
  "Coupling2Uri": "scm_truck_pack/scm_dolly_coupling.carcoupling",
  "Hidden": false,
  "Submeshes": null,
  "AnimationReferenceWheelRadius": null,
  "ResearchUri": "scm_truck_pack/scm_trucks.research",
  "Explosive": false,
  "ExplosionForce": null
}
```

* **Axles** (Array): Defines a list of vehicle axles.
	* **Uri**: Path of the .caraxle asset.
	* **Offset**: Axle position with respect to the center of the vehicle along the Z-axis. The front axle will have a positive value and the rear axle a negative value.
	* **HalfTrack**: Wheel position with respect to the X-axis of the vehicle. Positive values are always indicated. The game automatically reverses the value to position the other wheel on the opposite side of the vehicle.
	* **Steered**: Indicates whether the wheels on that axle are steered. Specifying vehicles with steered rear axles causes the rear wheels to not behave properly in curves and ramps.
* **UriAudio**: Path of the `.caraudio` asset.
* **Type**: Type of engine used by the vehicle. Possible values are Diesel, Gasoline, and Unpowered.
* **Length**: Vehicle length. By default the value is null but if it is a semi-trailer or trailer, the length must be specified because the semi-trailer has to overlap with the cab of the truck.
![](/images/truck-mod-tutorial/image6.png)
The green rectangle indicates the length to be specified in the semitrailer length configuration. Like other vehicles, > semi-trailers should be centered on the coordinate axes using this length as a reference, not the total length of the semi-trailer.
* **VelocityLimit**: Vehicle max speed in km/h.
* **Power**: Maximum engine power of the vehicle in Kw.
* **Weight**: Vehicle weight in metric tons.
* **Price**: Price of the vehicle, by default the value is `null`, the game calculates the price based on the max power if powered and/or capacity.
* **PriceMultiplier**: Vehicle price multiplier.
* **RunningCosts**: Vehicle maintenance cost.
* **RunningCostsMultiplier**: Vehicle maintenance cost multiplier.
* **Liveries** (Array):
    * **MeshUri**: Path of the mesh file (.obj) of the vehicle.
* **Coupling1Uri**, **Coupling2Uri**: Path of the `.carcoupling asset`. Trucks usually don't have couplings, the value of this parameter is `null` but if you want to put a semi-trailer or a dolly trailer, you must specify a front and/or rear couplings or both.
* **Hidden**: This parameter indicates whether or not the vehicle will be displayed in the vehicle purchase menu. A value `true` is usually set if the vehicle is made up of several parts and a `.carrecipe` asset has been created to display in the vehicle purchase window.
* **ResearchUri**: Path of the `.research` asset.
* **Explosive**: Determine if the transported cargo can explode. By default the value is `false`.
* **ExplosionForce**: Explosion force. By default the value is `null`. A very high value can cause a crater so large that it removes entire cities and industries from the map.

## Truck loads (.capacities asset)

This type of asset creates a load for items that are not visible, such as closed vans or trucks.
For this reason, the `Items` array only shows the reference to the `.item` asset of each type of cargo.

```json
{
  "Items": {
    "base/advanced_furniture.item": null,
    "base/advanced_wood_frame.item": null,
    ...
    "base/vacuum_tube.item": null,
    "base/wood_frame.item": null
  },
  "TargetUri": "scm_truck_pack/box_trailer.carunit",
  "MaxWeight": 20.0,
  "LoadingSpeedMultiplier": 1.0,
  "UnloadingSpeedMultiplier": 1.0
}
```

* **Items** (Array): List of pathes of the `.item` asset that the vehicle accepts.
* **TargetURI**: Path of the `.carunit` asset affected by the load.
* **MaxWeight**: Maximum capacity that the vehicle can load. The number of units depends on the weight of the loaded items.
* **LoadingSpeedMultiplier**: Vehicle load speed multiplier. By default, the value is `1.0`.
* **UnloadingSpeedMultiplier**: Vehicle unload speed multiplier. By default, the value is `1.0`.

## Truck loads (`.stackcapacity` asset)

This type of asset allows vehicles to have a stackable type load such as logs or planks.

Compared to the capacities load type, this asset has more parameters regarding the size and position of the load.

```json
{
  "Position": [0, 0.431, 0.228],
  "Rotation": [0, 0, 0],
  "SizeX": 0.685,
  "SizeZ": 1.3,
  "Items": {
    "base/wood_log.item": {
      "MeshUri": "base/wood_log.obj",
      "Resolution": {
        "X": 3,
        "Y": 2,
        "Z": 1
      },
      "Spacing": [0.02, 0.02, 0.03],
      "Capacity": null,
      "Explosive": false,
      "ExplosionForce": null
    },
    ...
  },
  "TargetUri": "scm_truck_pack/hopper_trailer.carunit",
  "MaxWeight": 22.0,
  "LoadingSpeedMultiplier": 1.0,
  "UnloadingSpeedMultiplier": 1.0
}
```

* **Position**: Position of the loading platform. The image shows the coordinate axis that represents the configured values.  
![](/images/truck-mod-tutorial/image4.png)
* **Rotation**: Rotation of the load. The value will always be 0 on each axis.
SizeX / SizeZ: Size of the loading platform that will determine the size of the items depending on the number of items that we want to stack.
![](/images/truck-mod-tutorial/image1.png)
* **Items** (Array): This array specifies each item that the vehicle can load.
* **MeshUri**: Path of the .obj file of the load item.
* **Resolution**: The resolution is a three-dimensional grid that indicates the number of items to be stacked along the indicated axis.
![](/images/truck-mod-tutorial/image5.png)
* **Spacing**: Separation between each item in the three axes (front/back - left-right - top-down).
* **Capacity**: Item carrying capacity. If the value is null, the maximum load of items will be calculated with the maximum load of the vehicle.
* **Explosive**: Determine if the transported cargo can explode. By default the value is false.
* **ExplosionForce**: Explosion force. By default the value is null. A very high value can cause a crater so large that it removes entire cities and industries from the map.


## Truck loads (`.heapcapacity` asset)

Heap-type loads are used for hopper-type vehicles to transport ores. This asset also adds animation parameters for loading and unloading the ore.

In the following image, you can see the mesh of the coal heap.
You can create a custom heap or use the model that comes with the base game but always set the parameters correctly.

![](/images/truck-mod-tutorial/image7.png)

```json
{
  "Keyframes": {
    "0": {
      "Position": [0, 0.466, 0.416],
      "Rotation": [0, 0, 0],
      "SizeX": 0.0,
      "SizeZ": 0.0,
      "ScaleY": 0.0
    },
    "0.2": {
      "Position": [0, 0.466, 0.416],
      "Rotation": [0, 0, 0],
      "SizeX": 0.8,
      "SizeZ": 2.657,
      "ScaleY": 0.5
    },
    "1": {
      "Position": [0, 0.541, 0.416],
      "Rotation": [0, 0, 0],
      "SizeX": 0.8,
      "SizeZ": 2.657,
      "ScaleY": 1.0
    }
  },
  "Items": {
    "base/coal.item": {
      "MeshUri": "scm_truck_pack/coal_heap.obj",
      "Capacity": null,
      "Explosive": false,
      "ExplosionForce": null
    }
...
  },
  "TargetUri": "scm_truck_pack/hopper_semitrailer.carunit",
  "MaxWeight": 32.0,
  "LoadingSpeedMultiplier": 1.0,
  "UnloadingSpeedMultiplier": 1.0
}
```

* **Keyframes** (Array): This array contains animation keyframes, `0.0` for when the vehicle is unloaded, some values for when it's partially loaded, and `1.0` one for when it is fully loaded. The value always goes from `0.0` to `1.0` regardless of the number of keyframes the load/unload animation has.

The following parameters are self-explanatory, specifying the position, rotation, and mesh size of the load object.

The rest of the parameters are the same as the rest of the assets explained above.


## Truck recipes (`.carrecipe` asset):

Like locomotives, trucks can form compositions like the case of trailers, which have a dolly trailer and trailer.

Its setting are exactly the same as the train recipe because it's the same asset. For more information read the section [Train recipe settings (`.trainrecipe` asset)](/guides/content-mods/creating-your-first-locomotive-mod/#train-recipe-settings-trainrecipe-asset) in the [Creating your first locomotive mod](/guides/content-mods/creating-your-first-locomotive-mod/) guide.

```json
{
  "Sections": [
    {
      "Count": null,
      "MinCount": null,
      "MaxCount": 1,
      "Units": [
        {
          "Uri": "scm_truck_pack/dolly_trailer.carunit",
          "Flipped": false
        },
        {
          "Uri": "scm_truck_pack/box_trailer.carunit",
          "Flipped": false
        }
      ]
    }
  ],
  "ResearchUri": "scm_truck_pack/scm_trucks.research",
  "Hidden": false
}
```

## Couplings (`.carcoupling` asset )

Most of the trucks don't have couplings, but if it's a trailer or a semi-trailer it will have couplings at the front (`Coupling1Uri`), or if a cab at the rear (`Coupling2Uri`), or in both locations for dolly trailers.

![](/images/truck-mod-tutorial/image3.png)

##  Further reading

* [How to publish your mod](/guides/how-to-publish-your-mod)