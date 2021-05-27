# Localization

You can easily translate your mod into multiple languages whether it's you or other people.

<!-- prettier-ignore -->
!!! note
    Translated strings are automatically applied to every asset mod.

<!-- prettier-ignore -->
!!! important
    When some strings are not found they fallback to `en` or `{uri#DisplayName}`.

## Files

<!-- prettier-ignore -->
!!! note
    Available language codes include but are not limited to: *en, de, pl, ru, cz, uk*. The full list can be found [here](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).

`{language}.strings` - this file is required for the game to recognize the language

Format:

```json
{
  "LocaleUri": "base/en.locale",
  "ItemsUri": "your_mod/en.json",
  "Items": {
    "your_mod/your_truck.carunit#DisplayName": "Your Truck"
  }
}
```

| Key       | Description                                                                                                                                         | Value                    |
| --------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| LocaleUri | Uri to the base language, defines the language of the strings                                                                                       | Uri                      |
| ItemsUri  | Uri to the localized strings, can be `null`                                                                                                         | Uri / `null`             |
| Items     | Object of the keys and localized strings (it's preffered to specify a separate file for the localized strings - usage of `ItemsUri`), can be `null` | Key value pairs / `null` |

---

`{language}.json` (preffered naming) - this file can contain localized strings

Format:

```json
{
  "your_mod/your_truck.carunit#DisplayName": "Your Truck",
  "your_mod/your_device.device#DisplayName": "Your Device"
}
```

Key - Uri to the thing you want to localize with `#DisplayName` appended after it

Value - Localized string

## Script mods

Script mods do not make use of available translated strings by themselves. They require you to get the string by hand.

<!-- prettier-ignore -->
!!! error
    The following code has not been confirmed to be working. It is based purely on the implementation of `LocaleManager`. Use at your own responsibility.

Getting the string for the current language:

```csharp
if (LocaleManager.Current.Locale.TryGetString("your_mod/your_truck.carunit#DisplayName", out DisplayString value))
{
  // Do something with your string
}
else
{
  // Key was not found
}

// or

DisplayString value = LocaleManager.Current.Locale.GetString("your_mod/your_truck.carunit#DisplayName"); // Warning! Throws ArgumentException when key is not found
```
