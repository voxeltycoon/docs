# Creating your first locomotive mod

!!! info
    This guide is authored by Voxel Tycoon community member **scailman**.

## Introduction

This guide tries to show you how to create a locomotive for use in Voxel Tycoon.

In Voxel Tycoon you can create steam, diesel or electric locomotives, but in this guide we will focus on creating an electric locomotive.
The guide is not intended to teach you modeling, so you must have a basic understanding of 3DS Max, Blender, Wings 3D, or any other program you want to use that allows you to import and export `.obj` files.

## Modeling suggestions

As in all games, there are certain recommendations that must be followed when creating a 3d model.

Apart from city buildings, trains and trucks are one of the most repeated assets in the game, and to avoid performance problems there are certain recommendations to follow.

* It's recommended that the body of the locomotive does not exceed 1500 triangles.
* The bogies and wheels should have a maximum of 1000 triangles since it's not as visible parts as the locomotive body.
* Make the necessary details so that the locomotive is recognizable but not overloaded.
* VT models are shorter than in real life.
* Depending on the type of locomotive you want to make, it's a good idea to import a model from the base game to compare the measurements and, in case of being an electric locomotive, have a reference of the height of the overhead wire for pantographs.

## Setting the model in the 3D modeling software

Vehicles are made up of different parts. In the case of trains, they are usually made up of  the body of the locomotive, bogies, and wheels. Steam locomotives also have several rods depending on their complexity.

All the elements that make up a vehicle must have the coordinate axis in position `0,0,0`, as shown in the following image:

![](/images/train-mod-tutorial/image4.png)

While creating the model of  the locomotive, we can place each part in place to verify that the proportions are correct, but when exporting the model, each part must be placed as in the previous image.

!!! important
    The locomotive should be placed facing the front to the right (view left in the viewport in 3ds max. In other programs, the placement of the viewports may vary).
    ![](/images/train-mod-tutorial/image3.png)

Texturing the model is done in the same way as a building. For this, I recommend reading the guide [Creating your first content mod](Creating-your-first-content-mod).

## Exporting the locomotive

Like any asset in VT, it must be exported in `.obj` format, and the files must be contained in `Content/<mod_name>`. It's recommended to create the same directory structure that uses the base game for convenience.

Each part of the locomotive must be a single `.obj` file that will then be linked through the different configuration asset files that will be explained below.

## Axles setting (`.trainaxle` asset)

This file is used to define the wheels of the locomotive. There is no limit to the number of axles that a locomotive or bogie can use, and each one can be a different size as in steam locomotives.

The file contains only two parameters:

```json
{
  "MeshUri": "spanish_pack/class1_axle.obj",
  "WheelRadius": 0.185
}
```

* **MeshUri**: This parameter specifies the path where the axis `.obj` file is located. The first part of the path is the mod folder.
* **WheelRadius**: This parameter is the radius of the wheel that we can obtain from the 3d program.

## Bogie settings (`.trainbogie` asset )

Locomotives may or may not have bogies in real life, but it must always be defined in the game.

This is what the .trainbogie asset looks like:

```json
{
  "MeshUri": "spanish_pack/class269_bo.obj",
  "AxleOffset": 0.113,
  "Axles": [
    {
      "Uri": "spanish_pack/class269_axle.trainaxle",
      "Offset": 0.316
    },
    {
      "Uri": "spanish_pack/class269_axle.trainaxle",
      "Offset": -0.316
    }
  ]
}
```

A bogie is made up of the mesh of the bogie itself and a section (axles) that define the type of axis and the position inside the bogie.

A bogie can have from 1 to n specified axes.

![](/images/train-mod-tutorial/image8.png)

* **MeshUri**: Specifies the path of the bogie mesh file. If the value is null, it means that the bogie has no mesh.
* **Uri**: Specifies the path of the axis .trainaxle file that we explained in the previous point. If the value is null, the wheel mesh will not appear.
* **AxleOffet**: Specify the axis position.
* **Offset**: Defines the axle position along the Z-axis of the bogie. A positive value means that it is the front wheel of the bogie and a negative value that is the rear wheel.

## Engine settings  (`.trainunit` asset )

This is the main file of the locomotive and where the rest of assets are linked. Many assets can be customized, including the sounds (which we will not explain in this guide).

The `.trainunit` asset has several sections and parameters and looks like the following on an electric locomotive.

Some sections are null, that means it hasn't been specified, or that this parameter is automatically calculated by the game.

```json
{
  "Smokes": null,
  "Bogies": [
    {
      "Uri": "spanish_pack/class1_bo.trainbogie",
      "Offset": 0.643,
      "Anchor1": true,
      "Anchor2": false,
      "Secondary": false
    },
    {
      "Uri": "spanish_pack/class1_bo.trainbogie",
      "Offset": -0.597,
      "Anchor1": false,
      "Anchor2": true,
      "Secondary": false
    }
  ],
  "AudioUri": "base/electric.trainaudio",
  "Type": "Electric",
  "Length": null,
  "VelocityLimit": 40.0,
  "Power": 160,
  "Weight": 30,
  "Price": null,
  "PriceMultiplier": null,
  "RunningCosts": null,
  "RunningCostsMultiplier": null,
  "Liveries": [
    {
      "MeshUri": "spanish_pack/class1a.obj"
    }
  ],
  "Coupling1Uri": "base/common.traincoupling",
  "Coupling2Uri": "base/common.traincoupling",
  "Hidden": true,
  "Submeshes": null,
  "AnimationReferenceWheelRadius": null,
  "ResearchUri": null,
  "Explosive": false,
  "ExplosionForce": null
}
```

* **Smoke**: Specifies the position of the smoke in diesel and steam locomotives.
* **Bogies** (Array):
  * **Uri**: Path of the .trainbogie asset.
  * **Anchor1**: Used to indicate the position of the bogie. For example, if the locomotive has 3 bogies, the values ​​of Anchor1 and Anchor2 will be: `true - false`, `false - false`, `false - true`.
  * **Anchor2**: Used to indicate the position of the bogie. For example, if the locomotive has 2 bogies, the values ​​of Anchor1 and Anchor2 will be: `true - false`, `false - true`.
  * **Offset**: Bogie position respecting to the locomotive along the Z-axis. A positive value means it's the front bogie and a negative value the rear bogie.
* **AudioUri**: Path of the .trainaudio asset.
* **Type**: Locomotive type. Possible values: Steam, Diesel, Electric, Unpowered.
* **Length**: By default the value is null, the game automatically calculates the length of the locomotive using the boundingbox of the `.obj` file. When a value is specified, it is because we want the locomotive to overlap with another element as it happens with the semi-trailers of the trucks.
* **VelocityLimit**: Maximum locomotive speed specified in km / h.
* **Power**: Max engine power specified in Kw.
* **Weight**: Locomotive weight specified in Tonnes.
* **Price**: Locomotive cost. The default is null. The game calculates the price based on the power of the locomotive and economic fluctuations.
* **PriceMultiplier**: Locomotive cost price multiplier. By default is null.
* **RunningCosts**: Locomotive operating cost. By default is null.
* **RunningCostsMultiplier**: Locomotive operating cost multiplier. By default is null.
* **Liveries** (Array):
  * **MeshUri**: Path of the `.obj` file of the locomotive body.
* **Coupling1Uri**: Path of the front locomotive `.traincoupling` asset.
* **Coupling2Uri**: Path of the rear locomotive `.traincoupling` asset.
> **Note:** Only cars with the same couplings could be coupled.
* **Hidden**: This parameter makes the locomotive not appear in the vehicle purchase menu. By default the value is `false`, but if the steam locomotive is articulated or requieres separate units (eg. Steam locomotive engine & tender, or fixed car suburban/subway set), this value will be `true`.
* **Submeshes** (Array): This section specifies the different meshes and animation parameters of the meshes of the rods of steam locomotives (see [Animating locomotive rods](Animating-locomotive-rods) guide).
* **AnimationReferenceWheelRadius**: Specifies the radius that the connecting rods will follow in the locomotives that have connecting rods.
* **ResearchUri**: If the locomotive needs to be researched in order to use it, this parameter indicates the path of the .research asset.
* **Explosive**: This parameter causes the locomotive or vehicle to explode in the event of an accident causing damage to the surrounding area. By default the value is false.
* **ExplosionForce**: Force of the explosion caused in the event of an accident if the explosive parameter is `true`. Setting it too high can cause the blast to damage the terrain so much that it destroys cities and entire resource deposits.

## Coupling setting (`.traincouplig` asset)

This asset allows defining a custom coupling for the locomotive that will make only locomotives and wagons that use the same coupling be able to be coupled.

This asset does not contain any parameters, and the file is empty, but it must exist in order to function properly.

## Train recipe settings (`.trainrecipe` asset)

In the game we can define that locomotives or trains will form a consist that cannot be separated, or that multiple vehicles will be purchased at the same time - such as the steam locomotives that when we buy one in the game from the purchase menu from the depot, we buy the locomotive and the tender as a set.

```json
{
  "Sections": [
    {
      "Count": null,
      "MinCount": null,
      "MaxCount": 1,
      "Units": [
        {
          "Uri": "s_hst/hst1_eng_a.trainunit",
          "Flipped": false
        }
      ]
    },
    {
      "Count": 0,
      "MinCount": 2,
      "MaxCount": 4,
      "Units": [
        {
          "Uri": "s_hst/hst1_car.trainunit",
          "Flipped": false
        }
      ]
    },
    {
      "Count": null,
      "MinCount": null,
      "MaxCount": 1,
      "Units": [
        {
          "Uri": "s_hst/hst1_eng_b.trainunit",
          "Flipped": true
        }
      ]
    }
  ],
  "ResearchUri": null,
  "Hidden": false
}
```

The file is divided into sections and you can indicate the number of minimum and maximum vehicles and what type a consist can have.

In the file shown, it represents a consist of a train that contains a locomotive at the front, between 2 and 4 passenger cars and another locomotive at the rear.

![](/images/train-mod-tutorial/image5.png)

The parameters of this asset are quite explanatory.

They indicate the minimum and maximum number of vehicles that make up the composition, what type they are (.trainunit asset) and whether they are inverted or not, such as the case of the rear locomotive.

* **ResearchUri**: If the consist or locomotive needs to be researched in order to use it, this parameter indicates the path of the .research asset.

* **Hidden**: This parameter makes the locomotive not appear in the vehicle purchase menu. By default the value is false, but if the steam locomotive is made up of the locomotive and the tender, this value will be true.

## Localization (`.strings` asset)

The .strings asset specifies the text that will be displayed in severals windows and menus in the game.

```json
{
  "LocaleUri": "base/en.locale",
  "Items": {
    "br_class05/steam_engine_6.trainunit#DisplayName": "Br Class 05 Engine",
    "br_class05/steam_engine_6_tender.trainunit#DisplayName": "Br Class 05 Tender",
    "br_class05/steam_engine_6.trainrecipe#DisplayName": "Br Class 05"
  }
}
```

In this example, it's show the text of the name of the locomotive and the tender as separate units and the train set as it appears in the purchase menu window.

You can have as many `.strings` assets as languages you want in the same folder.

##  Further reading

* [How to publish your mod](/guides/how-to-publish-your-mod)
* [Animating locomotive rods](/guides/content-mods/animating-locomotive-rods/)
* [Creating your first truck mod](/guides/content-mods/creating-your-first-truck-mod/)