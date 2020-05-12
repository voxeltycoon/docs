# Creating a small production chain

!!! info
    This guide is authored by Voxel Tycoon community member **scailman**.

## Introduction

In this guide you will learn how to create a new industry and all the elements that make it up. It's not a complex task but it's necessary to take into account many elements that are related to each other.

Since we've explained how to create vehicles and trains in other guides, the process for their creation will not be repeated in this guide.

A production chain can be very simple, using products and buildings that already exist in the base game, or have a very high degree of complexity, it all depends on our imagination.

The best thing before starting to create items, buildings and vehicles, is to have an idea of what we want to do and create a small diagram of all the elements that our production chain needs. This is highly recommended since on many occasions we will have to link buildings with items or vehicles and problems may come up when we forget to correctly configure something in an asset.

A production chain is made up of several steps, ore deposits, mining buildings, product processing building, warehouses and stores. All the buildings interact with each other and each one has a different extraction and production time, so adjustments must be made to have a balanced production in the different phases.

## Raw material deposits (`.depositrecipe` asset)

Deposits of raw materials are the beginning of the production chain and are scattered throughout the regions. They are the main source of resources. As a finite amount of resources, they will become depleted when fully mined and will no longer be possible to extract.

![](/images/production-mod-tutorial/image1.png)

```json
{
  "ItemUri": "scm_oil_industry/crude.item",
  "TintColor": "353535",
  "RadiusMultiplier": 0.5,
  "CapacityMultiplier": null,
  "DecorationUris": [],
  "Tier": 0
}
```

* **ItemUri**: Path of the item asset that will be extracted from the deposit.
* **TintColor**: This is the hexadecimal value of the color that the element represents on the map and when we press the Alt key to show icons on the map.
* **RadiusMultiplier**: Deposit size. By default the value is `null`. Values above `1` increase size and below decrease it.
* **CapacityMultiplier**: Amount of resources that can be extracted from the deposit. The default value is `null`.
* **DecorationUris** (Array):  Deposits can have decorations like trees in forests. It's a list of all the paths of the asset files that will be shown as decoration on the deposit.

```json
"DecorationUris": [
    "base/spruce.plant"
]
```

* **Tier**: Deposit level. Deposits at tier 0 are included in the first available region when a new map is created. Higher tiers are available at a further distance. E.g. Coal, Iron Ore and Wood are tier 0, but
Copper, Sand and Stone are tier 1.

## Extracting resources (`.mine` asset )

Mines or any other type of building that allows the extraction of raw resources are special buildings that must be placed  whithin the area of the deposit.
They can only be placed in the resource that it can extract, for example you can't place an iron mine in a coal deposit.
Mines can have animated submeshes like steam locomotives and sound and smoke for when they're active.

![](/images/production-mod-tutorial/image2.png)

```json
{
  "OutputInterval": 5.5,
  "Submeshes": [
    {
      "MeshUri": "scm_oil_industry/main_arm.obj",
      "DefaultAnimation": {
        "PositionY": {
          "0": 1.92
        },
		"PositionZ": {
          "0": 0.176 // y -0,176
        },
        "RotationX": {
          "0": 0.0,
          "0.125": -6.12,
          "0.25": -18.682,
          "0.375": -29.730,
          "0.5": -34.724,
          "0.625": -33.659,
          "0.75": -20.718,
          "0.875": -6.333,
          "1": 0.0
        }
      }
    },
	{
      "MeshUri": "scm_oil_industry/rod.obj",
      "DefaultAnimation": {
        "PositionY": {
          "0": 1.069,
          "0.125": 0.991,
          "0.25": 0.802,
          "0.375": 0.613,
          "0.5": 0.534,
          "0.625": 0.613,
          "0.75": 0.802,
          "0.875": 0.991,
          "1": 1.069
        },
		"PositionZ": {
          "0": -0.738,
          "0.125": -0.549,
          "0.25": -0.47,
          "0.375": -0.549,
          "0.5": -0.737,
          "0.625": -0.926,
          "0.75": -1.005,
          "0.875": -0.926,
          "1": -0.738
        },
        "RotationX": {
          "0": 0.0,
          "0.125": -12.104,
          "0.25": -15.204,
          "0.375": -6.296,
          "0.5": 8.13,
          "0.625": 20.407,
          "0.75": 20.007,
          "0.875": 12.128,
          "1": 0.0
        }
      }
    },
	{
      "MeshUri": "scm_oil_industry/rotor.obj",
      "DefaultAnimation": {
        "PositionY": {
          "0": 0.801
        },
		"PositionZ": {
          "0": -0.738
        },
        "RotationX": {
          "0": 0.0,
          "0.125": 45,
          "0.25": 90,
          "0.375": 135,
          "0.5": 180,
          "0.625": 225,
          "0.75": 270,
          "0.875": 315,
          "1": 360
        }
      }
    }
  ],
  "Sounds": null,
  "Smokes": null,
  "ResearchUri": "scm_oil_industry/oil_extraction.research",
  "Size": {
    "X": 2,
    "Y": 3,
    "Z": 3
  },
  "Liveries": {
    "default": {
      "MeshUri": "scm_oil_industry/crude_pump.obj",
      "MeshVariant": null,
      "Lights": null
    }
  },
  "Price": 53000.0,
  "RunningCosts": null,
  "Hidden": false
}
```

* **OutputInterval**: The time in seconds it takes to generate one unit.
* **Submeshes** (Array): The positions of the animations of the different meshes. For more information read the guide: Animating locomotive rods.
* **Sound** (Array):
    * **SoundUri**: Path of the .wav file used when the mine is active. 
    * **Time**: Sound duration time.
      ```json
      "Sounds": [
          {
            "SoundUri": "base/alloy_smelter_device.wav",
            "Time": 0.5
          }
      ]
      ```

* **Smoke** (Array):
    * **Uri**: Path of the `.smoke` asset.
    * **Position**: Smoke position in X, Y, Z axis.
        ```json
        "Smokes": [
            {
              "Uri": "scm_oil_industry/refinery_device.smoke",
              "Position": [-1.583, 5.4, 1.305]
            }
        ```

* **ResearchUri**: Path of the `.reserach` asset that allows the building to be researched to make it available in game.
* **Size** (Array): Building size on X, Y, Z axes.
* **Liveries** (Array): Specifies the path of the building's `.obj` file. For more information about this section read the guide: Creating your first building mod.
* **Price**: Building purchase price.
* **RunningCosts**: Building maintenance cost. By default the value is `null`.
* **Hidden**: Indicates whether or not the building appears in the mine construction menu. By default the value is false.

As with trains or trucks, you must have a `.capacities`, `.heapcapacities`, or `.stackcapacities` asset to specify which item it produces.

```json
{
  "Items": {
    "scm_oil_industry/crude.item": null
  },
  "TargetUri": "scm_oil_industry/crude_pump.mine",
  "MaxWeight": 100.0,
  "LoadingSpeedMultiplier": 1.0,
  "UnloadingSpeedMultiplier": 1.0
}
```

## Manufacturing products (`.device` asset)

Devices are the intermediate industries between raw material deposits and stores. These buildings require materials to produce the products that will be supplied to the stores.
Unlike the other buildings, these have input and output conveyor to supply raw materials or other required items.
The entrances and exits can be placed on any of the four facades of the building and don't have an established directionality, that is, if the building requires one item to produce another and has one entrance and one exit, it doesn't matter the direction of the conveyor.

![](/images/production-mod-tutorial/image3.png)

```json
{
  "RecipeTargetUri": "scm_oil_industry/refinery.recipetarget",
  "Submeshes": [],
  "Sounds": [
    {
      "SoundUri": "scm_oil_industry/refinery_device.wav",
      "Time": 0.5
    }
  ],
  "Smokes": [
    {
      "Uri": "scm_oil_industry/refinery_device.smoke",
      "Position": [-1.583, 5.4, 1.305]
    }
  ],
  "ClippingPlanes": null,
  "Conveyors": [
    {
      "SpawnConnection": 1,
      "Uri": "base/regular.conveyor",
      "ConveyorType": "StraightShort",
      "Position": {
        "X": 0,
        "Y": 0,
        "Z": 4
      },
      "Rotation": "Rotate90",
      "Handle": false
    },
    {
      "SpawnConnection": null,
      "Uri": "base/regular.conveyor",
      "ConveyorType": "Cap",
      "Position": {
        "X": -1,
        "Y": 0,
        "Z": 4
      },
      "Rotation": "Rotate90",
      "Handle": true
    },
	{
      "SpawnConnection": 1,
      "Uri": "base/regular.conveyor",
      "ConveyorType": "StraightShort",
      "Position": {
        "X": 0,
        "Y": 0,
        "Z": 5
      },
      "Rotation": "Rotate90",
      "Handle": false
    },
    {
      "SpawnConnection": null,
      "Uri": "base/regular.conveyor",
      "ConveyorType": "Cap",
      "Position": {
        "X": -1,
        "Y": 0,
        "Z": 5
      },
      "Rotation": "Rotate90",
      "Handle": true
    }
  ],
  "ResearchUri": "scm_oil_industry/oil_extraction.research",
  "Size": {
    "X": 7,
    "Y": 6,
    "Z": 8
  },
  "Liveries": {
    "default": {
      "MeshUri": "scm_oil_industry/refinery_device.obj",
      "MeshVariant": null,
      "Lights": null
    }
  },
  "Price": 45500.0,
  "RunningCosts": null,
  "Hidden": false
}
```

* **RecipeTargetUri**: The asset responsible for the building to accept recipes. The asset only contains the {} characters.
* **Submeshes** (Array): If the building has animated meshes in this section, the positions and rotations of each mesh are specified.
* **Sound** (Array):
	* **SoundUri**: Path of the .wav file used when the mine is active. 
	* **Time**: Sound duration time.

* **Smoke** (Array):
	* **Uri**: Path of the `.smoke` asset.
	* **Position**: Smoke position in X, Y, Z axis.

* **ClippingPlanes**: This is a plane that allows to darken an area of the building. An example is the plane used in train depots.
* **Conveyors** (Array): This section defines the conveyor belt as well as its position, orientation and type. An industry can have as many conveyor belts as desired and they don't all have to be on the same building facade.
  In this conveyor placement example, the building has a size of 6x8. In the right diagram, the light gray area represents the building.
  The coordinates (0,0) are always in the upper right corner of the building and the positive values go from right to left and from top to bottom.
  Values will be negative if they are above or to the right of the coordinates (0,0).
  The code shown above represent an industry that have two conveyor (orange area in the diagram) that start at positions (0,4) and (0,5) respectively and have a rotation  of  90 degrees.
  The rotation of the conveyors goes counterclockwise and starts at 0 degrees at the bottom of the building.
  ![](/images/production-mod-tutorial/image4.png)

* **SpawnConnection**: Specifies the connection of the conveyor where items will spawn. The beginning of the conveyor always has a value of `1`.
* **Uri**: Path of the `.conveyor` asset.
* **ConveyorType**: Type of tape to be placed in position. The possible values are: Cap, StraightShort and StraightExtraShort.
* **Position**: Position of the tape section on the X, Y, Z axes with respect to the grid shown in the previous image.
* **Rotation**: Conveyor rotation. Possible values: `Rotation0`, `Rotation90`, `Rotation180`, and `Rotation270`.
* **Handle**: Indicates whether the player can connect a conveyor or not.
* **ResearchUri**: Path of the `.research` asset that allows the building to be researched to make it available in game.
* **Size** (Array): Building size on X, Y, Z axes.
* **Liveries** (Array): Specifies the path of the building's `.obj` file. For more information about this section read the guide: Creating your first building mod.
* **Price**: Building purchase price.
* **RunningCosts**: Building maintenance cost. By default the value is `null`.
* **Hidden**: Indicates whether or not the building appears in the mine construction menu. By default the value is `false`.

## Devices recipes (`.recipe` asset)

In order to produce items an industry must have a recipe that tells what item it requires, how much quantity it needs, and what product is manufactured from that quantity of items.

```json
{
  "TargetUri": "scm_oil_industry/refinery.recipetarget",
  "Duration": 18.0,
  "InputItems": [
    {
      "Uri": "scm_oil_industry/crude.item",
      "Count": 10.0
    }
  ],
  "OutputItems": [
    {
      "Uri": "scm_oil_industry/diesel.item",
      "Count": 1.0
    }
  ],
  "ResearchUri": "base/iron_smelting.research"
}
```

* **TargetUri**: Path of the industry's `.recipe` target asset.
* **Duration**: Time to produce one item.
* **InputItems** (Array): Shows the items and the quantity of each required to produce products.
	* **Uri**: Path of the `.item` asset.
	* **Count**: Required quantity of the item.

* **OutputItems** (Array): How many products are produced with the input items.
	* **Uri**: Path of the `.item` asset.
	* **Count**: Quantity of the item produced.

* **ResearchUri**: Path of the `.research` asset that allows the building to be researched to make it available in game.

## Products (`.item` asset)

Items are the products that buildings require or generate.

![](/images/production-mod-tutorial/image5.png)

```json
{
  "IsLiquid": false,
  "Color": "353535",
  "MeshUri": "scm_oil_industry/crude_barrel.obj",
  "ConveyorLength": 0.3,
  "Weight": 0.5
}
```

* **IsLiquid**: Specifies if the item is liquid. For now all items are set to false because liquid loads are not yet implemented in the game.
* **Color**: Hexadecimal value of the color that represents the item in the pop-ups.
* **MeshUri**: `.obj` file used to represent the item.
* **ConveyorLength**: This value represents the size of the item on the conveyor. If the value is too high, the items will either overlap each other or run off the sides of the conveyor.
* **Weight**: Weight of one unit item.

## Storing resources and products (`.warehouse` asset ):

Warehouses allow items be stored so that certain buildings and vehicles can use them. Stores cannot be supplied directly from a warehouse.
They require a `.capacities`, `.heapcapacities`, or `.stackcapacities` asset in order to accept load.

![](/images/production-mod-tutorial/image6.png)

```json
{
  "ResearchUri": "scm_oil_industry/refined_diesel.research",
  "Size": {
    "X": 3,
    "Y": 3,
    "Z": 3
  },
  "Liveries": {
    "default": {
      "MeshUri": "scm_oil_industry/diesel_tank.obj",
      "MeshVariant": null,
      "Lights": null
    }
  },
  "Price": 28000.0,
  "RunningCosts": null,
  "Hidden": false
}
```

* **ResearchUri**: Path of the `.research` asset that allows the building to be researched to make it available in game.
* **Size** (Array): Building size on X, Y, Z axes.
* **Liveries** (Array): Specifies the path of the building's `.obj` file. For more information about this section read the guide: Creating your first building mod.
* **Price**: Building purchase price.
* **RunningCosts**: Building maintenance cost. By default the value is `null`.
* **Hidden**: Indicates whether or not the building appears in the mine construction menu. By default the value is false.

## Stores (`.house` asset ):

Stores are the end of the production chain and demand products that are paid depending on supply and demand.
With town or city growth, stores from time to time will increase in level and  the quantity of products they demand.
If demand is low and too much cargo is delivered, prices will drop and if demand is very high but we do not cover it, prices will rise but there is a risk that the business will go bankrupt and close.

![](/images/production-mod-tutorial/image7.png)

```json
{
  "PopulationRange": [1, 1],
  "CanHaveDemand": true,
  "Size": {
    "X": 7,
    "Y": 2,
    "Z": 5
  },
  "Liveries": {
    "default": {
      "MeshUri": "scm_oil_industry/gas_station.obj",
      "MeshVariant": null,
      "Lights": null
    },
    "default_night_1": {
      "MeshUri": "scm_oil_industry/gas_station.obj",
      "MeshVariant": "night_1",
      "Lights": null
    }
  },
  "Price": 33000.0,
  "RunningCosts": null,
  "Hidden": false
}
```

* **PopulationRange**: Specifies the population range that the building provides to the city when the city generates the store. It shows the minimum and maximum value of the population that it can have.
* **CanHaveDemand**: Specifies if the building can demand products.
* **Size**: Building size in X, Y, Z axes.
* **Liveries** (Array): Specifies the path of the building's ,obj file. For more information about this section read the guide: Creating your first building mod.
* **Price**: It is the price of the building, in this case the demolition price.
* **RunningCosts**: This is the operative cost of the building. As it is a city building, it has no effect on the player's finances. It is `null` value iby default.
* **Hidden**: This parameter indicates whether the object will appear in the game or in menus as buildable asset in the player's menu. Hidden assets can still be visible in game, e.g. locomotives in recipes.

## Selling products (`.citydemandrecipe` asset ):
This asset allows city stores to request a demand for products.

```json
{
  "ParentUri": null,
  "BuildingUri": "scm_oil_industry/gas_station.house",
  "ItemUri": "scm_oil_industry/diesel.item",
  "Tier": 2,
  "Demand": null,
  "DemandMultiplier": 2.0,
  "Price": null,
  "PriceMultiplier": null
}
```

* **ParentUri**: Path of the `.citydemandrecipe` asset if the demanded product requires other. For example, advanced wood frames require wood frames.
* **BuildingUri**: Path to the store's `.house` asset.
* **ItemUri**: Path of the `.item` asset of the product you are requesting.
* **Tier**: Store level is required to request the product. As with tiers of deposits, a tier 0 will appear at a starting point in the game with no research. A tier 1 will only appear after a tier 0 is receives demand within a town/city, and so on with each tier. If a tier 1 is active in a town/city, no new tier 0 stores will appear.
* **Demand**: Quantity of product demand. By default the value is `null`.
* **DemandMultiplier**: Multiplier of demand for the product. By default the value is `null`.
* **Price**: Price paid for one unit of product. If the value is `null` the game will calculate the price depending on the inflation.
* **PriceMultiplier**: Price multiplier.

## Researching the new industry (`.research` asset ):

Like other types of buildings in the game, industries can be researched to make them available in the game.
Researches may requiere a quantity of money or a number of items that must be delivered to the laboratories, some researches only become unlocked after previous reserch.

![](/images/production-mod-tutorial/image8.png)

```json
{
  "ParentResearchUris": [
    "base/research_and_development.research"
  ],
  "Tier": 2,
  "Days": 100,
  "DaysMultiplier": null,
  "PricePerDay": null,
  "PricePerDayMultiplier": null,
  "ItemsPerDay": [
    {
      "Uri": "base/iron_bar.item",
      "Count": null,
      "CountMultiplier": null
    }
  ],
  "CompletedByDefault": false,
  "Hidden": false,
  "Goal": false
}
```

* **ParentResearchUris** (Array): This is a list with the paths of all the `.research` assets of the research on which it depends.
* **Tier**: Research level.
* **Days**: Number of days required to complete the research.
* **DaysMultiplier**: Multiplier of the number of days required to complete the research.
* **PricePerDay**: Daily amount of money used to complete the research.
* **PricePerDayMultiplier**: Multiplier of daily amount of money used to complete the research.
* **ItemsPerDay** (Array): Amount of items that must be delivered per day for research.
	* **Uri**: Path of the `.item` asset required for research.
	* **Count**: Quantity of items required.
	* **CountMultiplier**: Required item quantity multiplier.
* **CompletedByDefault**: Specifies whether or not the research is completed from the beginning of the game.
* **Hidden**: Specifies whether or not the research is hidden in the game.
* **Goal**: Specifies if the research should display the game complete screen after the research ends.

That's it!

##  Further reading

* [How to publish your mod](/guides/how-to-publish-your-mod)