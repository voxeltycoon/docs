# Creating your first building mod

!!! quote "This guide is authored by Voxel Tycoon community member **scailman**"

## Introduction

This guide tries to show the basic steps to create a mod that adds new buildings in the city generation in Voxel Tycoon (as per `v0.80`).

The guide is not intended to teach you modeling, so you must have a basic understanding of 3DS Max, Blender, Wings 3D, or any other program you want to use that allows you to import and export `.obj` files.

## Modeling suggestions

As in all games, there are certain recommendations that must be followed when creating a 3d model.

* The size of the building should not exceed 5x5x10m.
* The model must have the minimum details that make it recognizable but without overloading the model.
* The colors have to be pastel colors so that match the same style as the rest of the buildings in the game.
* Use dark tones for windows. I recommend the value `#272727 (RGB 39,39,39)`.

## Basic concepts when modeling a building

![](https://user-images.githubusercontent.com/1748681/78715111-9643d480-7925-11ea-8de9-855f7828053a.png)

When starting the creation of a building, it is a good idea to think about what type of building we want to represent and what size it will have. A good recommendation is to import a building similar to the base game buildings on the size of our model.
A good practice is to start with a grid with the size of the building we want to make. See the following image.

![](https://user-images.githubusercontent.com/1748681/78715110-9643d480-7925-11ea-8b6e-cf8fa16e93ce.png)

Each grid represents a 1x1 meter that matches a voxel in the game.
Taking these dimensions into account, we know that the building must not exceed these limits when creating it.
The building can have as many parts as it can be, but when we export it to the game, it is recommended that there be only one single object that conforms to the entire building.
The coordinate axis must be located at `0,0,0`, although then the building is not centered with respect to the plane that we have used as a reference to define the size. This must be taken into account so that the building does not overlap with the roads or other buildings.

![](https://user-images.githubusercontent.com/1748681/78715096-93e17a80-7925-11ea-8f3c-2b162014095c.png)

The position of the main facade is important so that once the building is already in the game, it appears correctly located next to the roads and as a reference to the dimensions of the base of the building that we will have to configure later. In this case, the X-axis is the main facade of the building and measures 6m and the Z-axis is the bottom of the building and measures 4m.
The axis orientation may vary depending on the 3d program being used, which in this case is 3ds max.

## Texturing the building

VT texturing is very basic, it uses a 64x64 pixel square texture divided into different squares in which each unit will represent a color when the building is exported.

![](https://user-images.githubusercontent.com/1748681/78715113-96dc6b00-7925-11ea-9e0e-d6c251e766e4.png)

This base texture can be found in the folder `Content/your_first_pack" where the game is installed.
Once this texture has been applied to the model, we can start creating the unwrap separating all the polygons of the model depending on the color that we want them to have once it is finished.

![](https://user-images.githubusercontent.com/1748681/78715103-9512a780-7925-11ea-9f8d-aab31d2788f8.png)

This is how the building unwrap should look depending on the number of colors we are going to use.
For the night effect of the windows, in case the building has windows, the windows must be separated in different colors in the unwrap since they will be the different variations of windows lit at night. In the previous image, the unwrap has been created so that the building has three variations of night windows.
Later we will explain how to create the necessary settings so that the windows appear lit at night.

## Building export

Once we have the finished model, we can always export it to the game in `.obj` format. For now, it is only a simple 3d model but later we will configure the necessary files so that the game recognizes it and can generate our building in the cities.
All mods must be contained in the folder `Content/<mod_name>`.
For convenience and order, it's recommended to follow the same directory structure that the game uses and that can be verified by opening the folder `Content/base`.

## Building settings (`.house` asset)

In order for the game to recognize that we have created a building, we must create or copy the .house file of any existing building and modify the necessary parameters.
This file is located in the folder `Content/base/houses`.

To edit the game files we only need a text editor such as Notepad ++, or Visual Studio Code. I highly recommend VS Code as you can compare side by side.

```json
{
  "PopulationRange": [8, 12],
  "CanHaveDemand": false,
  "Size": {
    "X": 6,
    "Y": 4,
    "Z": 4
  },
  "Liveries": {
    "default": {
      "MeshUri": "arab_buildings/arab_house5_desert.obj",
      "MeshVariant": null,
      "Lights": null
    },
    "default_night_1": {
      "MeshUri": "arab_buildings/arab_house5_desert.obj",
      "MeshVariant": "night_1",
      "Lights": null
    },
    "default_night_2": {
      "MeshUri": "arab_buildings/arab_house5_desert.obj",
      "MeshVariant": "night_2",
      "Lights": null
    },
    "default_night_3": {
      "MeshUri": "arab_buildings/arab_house5_desert.obj",
      "MeshVariant": "night_3",
      "Lights": null
    }
  },
  "Price": 8800.0,
  "RunningCosts": null,
  "Hidden": false
}
```

This is what the `.house` asset file looks like and contains the following parameters:

* **PopulationRange**: Indicates the maximum and minimum population that the building will have when the city generates it.
* **CanHaveDemand** (`true`/`false`): This parameter indicates if it can request a product, as is the case in stores. In the rest of the buildings, the value is false.

* **Size**: Specifies the size of the building. These are the values we use in the reference plane. For the value of Y, the height, we must always round up, for example, if our building measures 2.4m (2.4 voxels) we must always indicate a value of 3.

* **Liveries**: In this parameter, the path of the mesh of our building that we exported previously is indicated. Note that the first part of MeshUri (arab_buildinhgs), is the name of our mod followed by the name of the `.obj` file.

	* **default_night_1(..3)**: is the name of the different liveries to show the windows lit at night. 	There are three liveries that match the unwrap of the model.

	* **MeshVariant**: Indicates the name of the variant specified in the `.obj.meta` file that defines the colors of the model that we will explain later.

* **Price**: It is the price of the building, in this case, the demolition price.

* **RunningCosts**: It is the operating cost of the building. As it is a city building, it has no effect on the player's finances. A null value indicates that loc automatically calculates the game.

* **Hidden** (`true`/`false`); This parameter indicates whether the object will appear in the game or in menus as a buildable asset in the player's menu. Hide assets are still visible in-game, eg. locomotives in recipes.

## Building settings (`.citybuildingspawninfo` asset)

This file tells the game how our building should generate when a city grows.

```json
{
  "Uri": "arab_buildings/arab_house5.house",
  "ProportionalCount": 50,
  "Density": 0.0,
  "Biomes": [
    "arab_buildings/desert2.biome"
  ]
}
```

* **Uri**: It is the path of the .house file that we explained previously.
* **ProportionalCount**: It is the proportion in which the building will appear with respect to the total number of buildings in the city.
* **Density**: Density of buildings in the city of this type.
* **Biomes**: This parameter indicates in which specific biome the building should appear. If the value is "null", the building will appear in all biomes, but if a biome is specified, the building will only appear in that biome as the buildings in the Arctic biome.

## Asset Editor

The asset editor integrated into the game and accessible from the main menu, allows us to modify the colors of any asset in the game.
In it, we will look for the building that we have created.

![](https://user-images.githubusercontent.com/1748681/78715109-95ab3e00-7925-11ea-988a-c98e9ecf8886.png)

The first time we access our building it will appear in gray color. This means you don't have a color palette assigned yet. To create a color palette we must click on Generate Palette and the model will now have the colors of the reference image that we used when creating the unwrap.

![](https://user-images.githubusercontent.com/1748681/78715105-95ab3e00-7925-11ea-947b-c6b5e8d59848.png)

To assign colors, we simply have to click on the different parts of the building that will be highlighted as we move the mouse over it and select a color in the window that appears on the right. To specify a specific color that we already have defined, you can enter the hexadecimal value of the color.
The different bars that appear below the color picker allow you to add brightness to the material or not to be affected by light at night, making it have the effect of lighting.

![](https://user-images.githubusercontent.com/1748681/78715112-96dc6b00-7925-11ea-8b3f-91126e3b1cb7.png)

_Once we have finished applying the colors, the building will look like this._

The different colors of the palette are saved in the `.obj.meta` file and contain the different variants that indicate what color and properties should be replaced for the effect of illuminated windows.

```json
{
  "Materials": [

    // ...skipping a few colors here to to simplify the example...
	
    {
      "Color": "ffde9f",
      "Glassiness": 0.0,
      "Specular": 0.0,
      "Smoothness": 0.0,
      "Emission": 0.0
    },
    {
      "Color": "a78466",
      "Glassiness": 0.0,
      "Specular": 0.0,
      "Smoothness": 0.0,
      "Emission": 0.0
    },
    {
      "Color": "c0c199",
      "Glassiness": 0.0,
      "Specular": 0.0,
      "Smoothness": 0.0,
      "Emission": 0.0
    },
    {
      "Color": "6a5341",
      "Glassiness": 0.0,
      "Specular": 0.0,
      "Smoothness": 0.0,
      "Emission": 0.0
    }
  ],
  "Variants": {
    "night_1": {
      "8": {
        "Color": "aa9d68",
        "Glassiness": 0.0,
        "Specular": 0.0,
        "Smoothness": 0.0,
        "Emission": 1.0
      }
    },
    "night_2": {
      "9": {
        "Color": "aa9d68",
        "Glassiness": 0.0,
        "Specular": 0.0,
        "Smoothness": 0.0,
        "Emission": 1.0
      }
    },
    "night_3": {
      "10": {
        "Color": "aa9d68",
        "Glassiness": 0.0,
        "Specular": 0.0,
        "Smoothness": 0.0,
        "Emission": 1.0
      }
    }
  }
}
```

The code above shows the color palette of the example building. We skipped some colors at the beginning because the listing would be too large but you can see the section of the variants.
In the variants section, the names of the three variants are defined for the night windows that appeared in the `.house` file named `night_1 - 3`.
In this case, the values 8, 9, 10 correspond to the colors in the upper section which are the ones to be replaced by the colors and parameters of the Variants section. To know what values you have to specify, the colors range from 0 to 15 (16 in total) but the easy way to find the correct colors is by the hexadecimal value. If color `#272727` was used, all colors with this value represent windows. Another parameter that can identify the windows in the Glossiness parameter, which in the rest of the colors will be `0.0`.


## Localization (`.strings` asset)

The location file allows indicating the name that will be shown in the menus or in the new information tool (pre-alpha 0.80) of the building.

```json
{
  "LocaleUri": "base/en.locale",
  "Items": {
	"arab_buildings/desert2.biome#DisplayName": "Desert",
	"arab_buildings/palm_tree.plant#DisplayName": "Palm tree",
	"arab_buildings/arab_house1.house#DisplayName": "House 1",
	"arab_buildings/arab_house2.house#DisplayName": "House 2",
	"arab_buildings/arab_house3.house#DisplayName": "House 3",
	"arab_buildings/arab_house4.house#DisplayName": "House 4",
	"arab_buildings/arab_house5.house#DisplayName": "House 5",
	"arab_buildings/arab_obelisc_desert.house#DisplayName": "Obelisk",
	"arab_buildings/arab_store.house#DisplayName": "Store",
	"arab_buildings/arab_watertower.house#DisplayName": "Water tower",
	}
}
```

The image shows that the indicated `LocaleUri` language is English and in the Items section the path of all the files of the different objects created is specified, in this case several buildings (`.house`), a biome (`.biome`) and a plant (`.plant`).

You can have as many `.strings` files as languages you want to have in the mod.

## Publishing the mod

Once you have finished modeling the building, configuring the different files and applying the color palette, all you have to do is create an image of the mod (`preview.png`) that will be shown in the mod finder and that must have dimensions of **512x512 pixels**.
It is also necessary to create a `mod.json` file where the description of the mod is specified and which in turn allows the mod to appear in the mod selection window when creating a new game.

```json
{
    "Title" : "Adobe buildings V1.0",
    "Description" : "This mod add new desert biome and 8 specific buildings for this biome.
	
	Buildings:
	- 5 different residential  houses
	- 1 shop for all base game items
	- 1 obelisk
	- 1 Water tower
	
	Biomes:
	- Desert with palm trees
	
	Localization: bg, de, en, es, fr, it, nl, pl, pt, ru, tr, uk.
	
	Changelog:
	-Release.
	
	Version: 1.0."
 }
```

## Further reading

* [How to publish your mod](/guides/basics/how-to-publish-your-mod)
- [Creating your first locomotive mod](/guides/content-mods/creating-your-first-locomotive-mod)