# Creating a vehicle interior/cockpit

!!! quote "This guide is authored by Voxel Tycoon community member **scailman**"

## Introduction

This feature allows the camera to be positioned inside the vehicle in *Ride Your Vehicle* mode, giving the impression of traveling within the vehicle. This feature is optional. If a vehicle lacks a custom interior configuration, the game will use the default setup.

---

## Modeling

### Interior mesh

The mesh representing the interior should be slightly smaller than the vehicle's exterior model and include visible external elements like the front of locomotives, boilers, chimneys, railings, etc.

![](/images/creating-vehicle-interior/1.png)

- Windows should be simple openings in the mesh, positioned and sized identically to the windows in the vehicle's model.
- Exterior faces that are not visible from the interior can be removed to reduce the polygon count.
- Depending on the type of vehicle, specific independent elements may be required, as detailed below.

### Animated sub-meshes

For trucks, buses, and locomotives, additional animated sub-meshes (optional) can be included to add detail to the interior.

![](/images/creating-vehicle-interior/2.png)

Optional elements include:

- Steering wheel
- Brake pedal
- Accelerator pedal
- Speed dial needle
- Combined accelerator and brake control

These sub-meshes should be modeled with their center or pivot at position `(0,0,0)`.

!!! tip
    You can place these elements in a common folder inside your mod for easy organization and reuse across multiple interiors.

## `.carunit`/`.trainunit` asset configuration

This section details the parameters and sections required to enable the interior view of a vehicle.

### `Interior` section

Defines the various sub-meshes, their positions, and the vehicle's interior mesh.

```json
"Interior": {
    "Submeshes": [
        {
            "SteerAnimation": {
                "PositionX": { "0": -0.202 },
                "PositionY": { "0": 0.55 },
                "PositionZ": { "0": 0.369 },
                "RotationX": { "0": 50.0 },
                "RotationZ": { "0": 400.0, "1": -400.0 }
            },
            "MeshUri": "base/steering_wheel.obj"
        },
        {
            "BrakeAnimation": {
                "PositionX": { "0": -0.227 },
                "PositionY": { "0": 0.422 },
                "PositionZ": { "0": 0.445 },
                "RotationX": { "0": 0.0, "1": -45.0 }
            },
            "MeshUri": "base/pedal.obj"
        },
        {
            "PowerAnimation": {
                "PositionX": { "0": -0.178 },
                "PositionY": { "0": 0.422 },
                "PositionZ": { "0": 0.445 },
                "RotationX": { "0": 0.0, "1": -45.0 }
            },
            "MeshUri": "base/pedal.obj"
        },
        {
            "VelocityAnimation": {
                "PositionX": { "0": -0.067 },
                "PositionY": { "0": 0.52 },
                "PositionZ": { "0": 0.398 },
                "RotationX": { "0": 0.0 },
                "RotationZ": { "0": 0.0, "0.25": -75, "0.5": -150, "0.75": -225, "1": -300.0 }
            },
            "MeshUri": "base/needle.obj"
        }
    ],
    "PowerAndBrakeAnimation": null,
    "HideExterior": false,
    "MeshUri": "base/gasoline_bus_interior.obj"
}
```

Each sub-mesh is defined by its animation type: `SteerAnimation`, `BrakeAnimation`, `PowerAnimation`, `VelocityAnimation`, and `PowerAndBrakeAnimation`.

- **PositionX, PositionY, PositionZ** specify the position of each element inside the vehicle.
- **RotationX, RotationY, RotationZ** define the rotation of each element depending on the rotation axis.

For the steering wheel, two keys specify the maximum turn degrees to the left and right. For the speed dial needle, additional keys can be added for smoother movement.

- **MeshUri** specifies the file path of each element's `.obj` file.

In the *Interior* section, two parameters are defined:

- **HideExterior**: Determines whether the vehicle's exterior mesh is hidden in interior view.
- **MeshUri**: Specifies the path to the vehicle interior’s `.obj` file.

### `CameraSpots` section

Specifies the camera positions for the interior view when traveling in first-person. If no camera positions are specified, the game will use the default three positions when traveling in a vehicle.

Each subsection includes:

![](/images/creating-vehicle-interior/4.png)

- **Position**: Array defining the camera’s position.
- **Rotation**: Initial camera rotation in degrees. A value of 0.0 indicates the camera is facing forward.
- **ShowInterior**: Specifies whether the interior mesh is displayed at that camera position.

## Finishing touches

To add realism to the interior view, once the interior is modeled and configured, colors can be set in the Asset Editor to emit a bit of light at night, giving the impression of interior lighting. Set the **Emission** slider to a value of 125 for this effect.

![](/images/creating-vehicle-interior/3.png)