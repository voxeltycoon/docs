# Creating your script mod with harmony

## Introduction

В данном туториале мы научимся делать просты моды с библиотекой harmony. 

## Create a new project

Что бы приступить к работе, Вам необходимо создать свой проект для будущего мода. Как это сделать описано в интсрукции [Creating your first script mod](creating-your-first-script-mod.md). В данном туториале будет использованно название `VTFirstModeHarmony` для проекта мода.

Следующем шагом будет добавление в зависимости библиотеки 0harmony.dll. Необходимо выбрать правильную версию, которая используется в Voxel Tycoon. Для этого найдите место где установлена игра и откройте папку с используемыми библиотеками `VoxelTycoon_Data\Managed`. У меня этот путь называется так: `F:\not_portable\Steam\steamapps\common\VoxelTycoon\VoxelTycoon_Data\Managed`. У Вас пути могут отличаться.

Далее мы находим файл `0harmony.dll` и добавляем его в зависимости нашего проекта. Как это сделать вы можете узнать в гайде: [Creating your first script mod](creating-your-first-script-mod.md)

## Write some code

Теперь приступим к написанию плагина. В первой половине гайда мы сделаем заготовку мода, которую можно будет использовать в будущем. Во второй половине, мы релизуем некоторый уникальный функционал для нашего мода. И так, поехали!

### Сверка кода (0)

Для начала давайте сверим текущий код в файле `Class1.cs`:

```csharp
using System;

namespace VTFirstModeHarmony
{
    public class Class1 : Mod
    {
        protected override void OnGameStarted()
        {
            // That's where our mod logic goes.
        }
    }
}
```

### Пишем заготовку

Мое пространство имен нзывается `VTFirstModeHarmony` как название моего проекта. У Вас оно может отличаться. Не забудте далее в коде так же заменить его в случае отличия.

Начнем писать код. Первым делом переименнуем файл `Class1.cs` в `VTFirstModeHarmonyMod.cs`, где тэг `Mod` является негласным правилом наименования файла - точки входа в нашу программу-мод. В окне на изменение всех ссылок мы ответим да. В случае если оно не выскочело Вам придется переименновать название своего класса вручную.

Далее подключем необходимые пространста имен:
```csharp
using HarmonyLib;
using VoxelTycoon.Modding;
```

Добавляем логгер:
```csharp
using Logger = VoxelTycoon.Logger;
```

Объявляем необходимые поля нашего класса:
```csharp
private Harmony _harmony;
private const string HarmonyID = "cz.overload.vtfirstmodeharmony.patch";
public static readonly Logger Logger = new Logger("VTFirstModeHarmony");
```

Объявляем метод `Initialize`:
```csharp
protected override void Initialize()
{
    Harmony.DEBUG = false;
    this._harmony = new Harmony(VTFirstModeHarmonyMod.HarmonyID);

    VTFirstModeHarmonyMod.Logger.Log("VTFirstModeHarmonyMod Initialize");
    this._harmony.PatchAll();
}
```

Изменяем метод `OnGameStarted` что бы увидеть в логах подтверждение нормальной работы:
```csharp
protected override void OnGameStarted()
{
    VTFirstModeHarmonyMod.Logger.Log("Log is work.");
}
```

Объявляем метод `OnUpdate`, он нам понадобится в будущем:
```csharp
protected override void OnUpdate()
{
    // That's where our mod logic goes.
}
```

Объявляем метод `Deinitialize` что бы освободить все ссылки перед завершением работы мода:
```csharp
protected override void Deinitialize()
{
    this._harmony.UnpatchAll(VTFirstModeHarmonyMod.HarmonyID);
    this._harmony = null;
}
```

Так же не забываем пропатчить наш класс. Это нам понадобится в будущем.
```csharp
[HarmonyPatch]
public class VTFirstModeHarmonyMod : Mod
```

### Сверка кода (1)
В результате у нас получается такой код в файле `VTFirstModeHarmonyMod.cs`:
```csharp
using HarmonyLib;
using VoxelTycoon.Modding;

using Logger = VoxelTycoon.Logger;

namespace VTFirstModeHarmony
{
    [HarmonyPatch]
    public class VTFirstModeHarmonyMod : Mod
    {
        private Harmony _harmony;
        private const string HarmonyID = "cz.overload.vtfirstmodeharmony.patch";
        public static readonly Logger Logger = new Logger("VTFirstModeHarmony");

        protected override void Initialize()
        {
            Harmony.DEBUG = false;
            this._harmony = new Harmony(VTFirstModeHarmonyMod.HarmonyID);

            VTFirstModeHarmonyMod.Logger.Log("VTFirstModeHarmonyMod Initialize");
            this._harmony.PatchAll();
        }
        protected override void OnGameStarted()
        {
            VTFirstModeHarmonyMod.Logger.Log("Log is work.");
        }

        protected override void OnUpdate()
        {
            // That's where our mod logic goes.
        }

        protected override void Deinitialize()
        {
            this._harmony.UnpatchAll(VTFirstModeHarmonyMod.HarmonyID);
            this._harmony = null;
        }
    }
}
```

### Check result (1)

Скомпилируйте свой мод и доставьте его в игру. Как это сделать смотрите в гайде [Creating your first script mod](creating-your-first-script-mod.md).

В результате у нас не должно быть ошибок и мы после старта новой игры должны увидеть следующие строки в файле логов:
```console
[22.09.2021 23:19:48] [VTFirstModeHarmony] VTFirstModeHarmonyMod Initialize
[22.09.2021 23:20:14] [VTFirstModeHarmony] Log is work.
```
### Дополнительная информация

!!! Info
    Прежде чем продолжить, необходимо ознакомится с возможностями библиотеки `harmony`. Всё API изучать не нужно, но надо знать как harmony передает параметры в наши пропатченные функции. Вам необходимо перейти в [документацию harmony](https://harmony.pardeike.net/articles/intro.html) и изучить её полностью. Не переживайте если что-то упустите, и смело задавайте вопросы в чате дискорд. Вкладку API Documentation пока изучать не нужно.

### Пишем новый функционал

Сейчас мы начнем реализовывать уникальный для нашего мода функционал. Он будет простой, но на основе этого примера Вы поймете как модифицировать другие объекты в `Voxel Tycoon`.

Добавим несколько новых зависимостей в проект как делали это для предыдущих бибилотек. Какие это файлы? Вот они:

* UnityEngine.CoreModule
* UnityEngine.TextRenderingModule
* UnityEngine.UI

!!! note
    Сейчас мы будем работать только с файлом `VTFirstModeHarmonyMod.cs`. Если мы перейдем в другой файл вы увидете точно такой же блок информации.

Теперь добавим пространства имен.
```csharp
using HarmonyLib;

using VoxelTycoon;
using VoxelTycoon.UI;
using VoxelTycoon.Modding;
```

Далее заменим содержимое функции `OnUpdate` на следующий код:

```csharp
protected override void OnUpdate()
{
    // That's where our mod logic goes.
    if (InputHelper.MouseDown)
    {
        // TestMsg.ShowAtScreenCenter("TestMsg", 5);
    }


    if (InputHelper.RightMouseDown)
    {
        OverlayMessage.ShowAtScreenCenter("OverlayMessage", 5);
    }
}
```

На этом изменения в файле `VTFirstModeHarmonyMod.cs` завершены.

Давайте добавим новый класс в наш проект и назовем его `TestMsg.cs`.

!!! note
    Работаем в файле `TestMsg.cs`.

После создания в нем будет следующий код:

```csharp
using System;
using System.Collections.Generic;
using System.Text;

namespace VTFirstModeHarmony
{
    class TestMsg
    {
    }
}
```

Не буду Вас мучить долгим описанием и расскажу наш план. У нас задача полностью повторить один из классов разработчиков. Выбор пал на класс `OverlayMessage`. Это можно сделать двумя путями:

* Простым наследованием нужного нам (простой способ)
* Полным копированием исходного кода (сложный способ)

Мы выбрали второй вариант, т.к. он не может быть релизован в лоб и тут есть над чем задуматься.

Для начала подключим новые пространства имен:

```csharp
using System.Collections;
using System.Collections.Generic;

using VoxelTycoon.UI;

using UnityEngine;
using UnityEngine.UI;

using HarmonyLib;
using VoxelTycoon;
```

Далее я просто приведу код, который скопировал из кода разработчиков Voxel Tycoon.

```csharp
class TestMsg : OverlayPopup
{
    internal Text _message;
    protected static List<TestMsg> _messages = new List<TestMsg>();

    public string Message
    {
        get => this._message.text;
        set => this._message.text = value;
    }

    public float Lifetime { get; set; }

    /*
    protected internal override void InitializeFrame()
    {
        base.InitializeFrame();
        this._message = this.transform.AddUIChild("Message").AddComponent<UnityEngine.UI.Text>();
        this._message.font = R.Fonts.OpenSans.OpenSansRegular;
        this._message.color = Color.white;
        this.Padding = new RectOffset(15, 15, 8, 8);
    }*/

    protected override void OnShow()
    {
        base.OnShow();
        if ((double)this.Lifetime <= 0.0)
            return;
        this.StartCoroutine(this.PrepareToDie());
    }

    protected IEnumerator PrepareToDie()
    {
        TestMsg DebugMsg = this;
        float deadline = Time.unscaledTime + DebugMsg.Lifetime;
        while ((double)Time.unscaledTime < (double)deadline)
            yield return (object)null;
        DebugMsg.Close();
    }

    public static TestMsg ShowAtScreenCenter(string message, float lifetime = 2f)
    {
        TestMsg frame = UIManager.Current.CreateFrame<TestMsg>(FrameAnchoring.Center);
        frame.Message = message;
        frame.Lifetime = lifetime;
        RectTransform rectTransform1 = frame.RectTransform;
        RectTransform rectTransform2 = frame.RectTransform;
        Vector2 vector2_1 = new Vector2(0.5f, 0.5f);
        Vector2 vector2_2 = vector2_1;
        rectTransform2.anchorMax = vector2_2;
        Vector2 vector2_3 = vector2_1;
        rectTransform1.anchorMin = vector2_3;
        frame.RectTransform.pivot = new Vector2(0.5f, 0.5f);
        frame.Show();
        return frame;
    }

    public static void ShowStacked(string message, float lifetime = 2f) => TestMsg.ShowStacked(message, 5000, lifetime);

    public static void ShowStacked(string message, int priority, float lifetime = 2f)
    {
        TestMsg frame = UIManager.Current.CreateFrame<TestMsg>(FrameAnchoring.Center);
        frame.Message = message;
        frame.Lifetime = lifetime;
        frame.Priority = priority;
        RectTransform rectTransform1 = frame.RectTransform;
        RectTransform rectTransform2 = frame.RectTransform;
        Vector2 vector2_1 = new Vector2(0.5f, 0.0f);
        Vector2 vector2_2 = vector2_1;
        rectTransform2.anchorMax = vector2_2;
        Vector2 vector2_3 = vector2_1;
        rectTransform1.anchorMin = vector2_3;
        frame.RectTransform.pivot = new Vector2(0.5f, 0.0f);
        frame.Show();
        TestMsg._messages.Add(frame);
        frame.StartCoroutine(TestMsg.UpdatePositionsOnNextFrame());
    }

    protected void OnDestroy()
    {
        TestMsg._messages.Remove(this);
        TestMsg.UpdatePositions();
    }

    private static void UpdatePositions()
    {
        TestMsg DebugMsg = (TestMsg)null;
        for (int index = TestMsg._messages.Count - 1; index >= 0; --index)
        {
            TestMsg message = TestMsg._messages[index];
            message.RectTransform.anchoredPosition = new Vector2(0.0f, (Object)DebugMsg != (Object)null ? (float)((double)DebugMsg.RectTransform.anchoredPosition.y + (double)DebugMsg.RectTransform.rect.height + 10.0) : 110f);
            DebugMsg = message;
        }
    }

    private static IEnumerator UpdatePositionsOnNextFrame()
    {
        yield return (object)null;
        TestMsg.UpdatePositions();
    }
}
```

Тут можно найти закоментированный блок. Это важная часть класса. Без неё работать наш мод не будет. Если мы попробуем разкоментировать его, то у нас появится предупреждение о том, что мы не можем перегружать поля у которых выставлен модификатор internal. Как тогда нам быть? Тут и приходит на помощь `harmony`.

И так, давайте добавим ещё один класс в после `TestMsg`.

```csharp
[HarmonyPatch]
class TestMsgPatch
{
    [HarmonyPostfix]
    [HarmonyPatch(typeof(OverlayPopup), "InitializeFrame")]
    protected static void InitializeFramePatchPostFix(TestMsg __instance)
    {
        if (__instance.GetType() != typeof(TestMsg)) return;

        VTFirstModeHarmonyMod.Logger.Log("===============================.");
        VTFirstModeHarmonyMod.Logger.Log("InitializeFramePatchPostFix.");
        VTFirstModeHarmonyMod.Logger.Log("===============================.");

        __instance._message = __instance.transform.AddUIChild("Message").AddComponent<UnityEngine.UI.Text>();
        __instance._message.font = R.Fonts.OpenSans.OpenSansRegular;
        __instance._message.color = Color.white;
        __instance.Padding = new RectOffset(15, 15, 8, 8);
    }
}
```

Здесь мы создаем класс с патчами через гармонию. Что бы они работали, класс нужно пропатчивать, поэтому нам нужно было создать его отдельно.
В данном коде мы указываем `Harmony` вызывать функцию `InitializeFramePatchPostFix` после метода `InitializeFrame`. Возникает проблема следующего характера: этот код будет срабатывать на все классы которые наследуются от класса `OverlayPopup`. Что бы отфильтровать только наш класс, первым делом мы выставляем проверку на тип:

```csharp
if (__instance.GetType() != typeof(TestMsg)) return;
```

Она и не дает выполняться нашему коду нигде кроме класса `TestMsg`.

Далее в коде мы видем логи, для того что бы быть увереным что всё работает как надо.

```csharp
VTFirstModeHarmonyMod.Logger.Log("===============================.");
VTFirstModeHarmonyMod.Logger.Log("InitializeFramePatchPostFix.");
VTFirstModeHarmonyMod.Logger.Log("===============================.");
```

И после логов мы вставили те самые 4 строчки кода, которые были в оригинальном методе `InitializeFrame` из класса `OverlayMessage`.

```csharp
__instance._message = __instance.transform.AddUIChild("Message").AddComponent<UnityEngine.UI.Text>();
__instance._message.font = R.Fonts.OpenSans.OpenSansRegular;
__instance._message.color = Color.white;
__instance.Padding = new RectOffset(15, 15, 8, 8);
```

На этом закончим редактировать файл `TestMsg.cs`.

!!! note
    Работаем в файле `VTFirstModeHarmonyMod.cs`.

Давайте вызовем отрисовку текста через новый класс. Для этого разкоментируем следующую строчку кода в методе `OnUpdate`:

```csharp
TestMsg.ShowAtScreenCenter("TestMsg", 5);
```

### Сверка кода (2)

!!! note
    Файл `VTFirstModeHarmonyMod.cs`.

```csharp
using HarmonyLib;

using VoxelTycoon;
using VoxelTycoon.UI;
using VoxelTycoon.Modding;

using Logger = VoxelTycoon.Logger;

namespace VTFirstModeHarmony
{
    [HarmonyPatch]
    public class VTFirstModeHarmonyMod : Mod
    {
        private Harmony _harmony;
        private const string HarmonyID = "cz.overload.vtfirstmodeharmony.patch";
        public static readonly Logger Logger = new Logger("VTFirstModeHarmony");

        protected override void Initialize()
        {
            Harmony.DEBUG = false;
            this._harmony = new Harmony(VTFirstModeHarmonyMod.HarmonyID);

            VTFirstModeHarmonyMod.Logger.Log("VTFirstModeHarmonyMod Initialize");
            this._harmony.PatchAll();
        }
        protected override void OnGameStarted()
        {
            VTFirstModeHarmonyMod.Logger.Log("Log is work.");
        }

        protected override void OnUpdate()
        {
            // That's where our mod logic goes.
            if (InputHelper.MouseDown)
            {
                TestMsg.ShowAtScreenCenter("TestMsg", 5);
            }


            if (InputHelper.RightMouseDown)
            {
                OverlayMessage.ShowAtScreenCenter("OverlayMessage", 5);
            }
        }

        protected override void Deinitialize()
        {
            this._harmony.UnpatchAll(VTFirstModeHarmonyMod.HarmonyID);
            this._harmony = null;
        }
    }
}
```

!!! note
    Файл `VTFirstModeHarmonyMod.cs`.

```csharp
using System.Collections;
using System.Collections.Generic;

using VoxelTycoon.UI;

using UnityEngine;
using UnityEngine.UI;

using HarmonyLib;
using VoxelTycoon;

namespace VTFirstModeHarmony
{
    class TestMsg : OverlayPopup
    {
        internal Text _message;
        protected static List<TestMsg> _messages = new List<TestMsg>();

        public string Message
        {
            get => this._message.text;
            set => this._message.text = value;
        }

        public float Lifetime { get; set; }

        /*
        protected internal override void InitializeFrame()
        {
          base.InitializeFrame();
          this._message = this.transform.AddUIChild("Message").AddComponent<UnityEngine.UI.Text>();
          this._message.font = R.Fonts.OpenSans.OpenSansRegular;
          this._message.color = Color.white;
          this.Padding = new RectOffset(15, 15, 8, 8);
        }*/

        protected override void OnShow()
        {
            base.OnShow();
            if ((double)this.Lifetime <= 0.0)
                return;
            this.StartCoroutine(this.PrepareToDie());
        }

        protected IEnumerator PrepareToDie()
        {
            TestMsg DebugMsg = this;
            float deadline = Time.unscaledTime + DebugMsg.Lifetime;
            while ((double)Time.unscaledTime < (double)deadline)
                yield return (object)null;
            DebugMsg.Close();
        }

        public static TestMsg ShowAtScreenCenter(string message, float lifetime = 2f)
        {
            TestMsg frame = UIManager.Current.CreateFrame<TestMsg>(FrameAnchoring.Center);
            frame.Message = message;
            frame.Lifetime = lifetime;
            RectTransform rectTransform1 = frame.RectTransform;
            RectTransform rectTransform2 = frame.RectTransform;
            Vector2 vector2_1 = new Vector2(0.5f, 0.5f);
            Vector2 vector2_2 = vector2_1;
            rectTransform2.anchorMax = vector2_2;
            Vector2 vector2_3 = vector2_1;
            rectTransform1.anchorMin = vector2_3;
            frame.RectTransform.pivot = new Vector2(0.5f, 0.5f);
            frame.Show();
            return frame;
        }

        public static void ShowStacked(string message, float lifetime = 2f) => TestMsg.ShowStacked(message, 5000, lifetime);

        public static void ShowStacked(string message, int priority, float lifetime = 2f)
        {
            TestMsg frame = UIManager.Current.CreateFrame<TestMsg>(FrameAnchoring.Center);
            frame.Message = message;
            frame.Lifetime = lifetime;
            frame.Priority = priority;
            RectTransform rectTransform1 = frame.RectTransform;
            RectTransform rectTransform2 = frame.RectTransform;
            Vector2 vector2_1 = new Vector2(0.5f, 0.0f);
            Vector2 vector2_2 = vector2_1;
            rectTransform2.anchorMax = vector2_2;
            Vector2 vector2_3 = vector2_1;
            rectTransform1.anchorMin = vector2_3;
            frame.RectTransform.pivot = new Vector2(0.5f, 0.0f);
            frame.Show();
            TestMsg._messages.Add(frame);
            frame.StartCoroutine(TestMsg.UpdatePositionsOnNextFrame());
        }

        protected void OnDestroy()
        {
            TestMsg._messages.Remove(this);
            TestMsg.UpdatePositions();
        }

        private static void UpdatePositions()
        {
            TestMsg DebugMsg = (TestMsg)null;
            for (int index = TestMsg._messages.Count - 1; index >= 0; --index)
            {
                TestMsg message = TestMsg._messages[index];
                message.RectTransform.anchoredPosition = new Vector2(0.0f, (Object)DebugMsg != (Object)null ? (float)((double)DebugMsg.RectTransform.anchoredPosition.y + (double)DebugMsg.RectTransform.rect.height + 10.0) : 110f);
                DebugMsg = message;
            }
        }

        private static IEnumerator UpdatePositionsOnNextFrame()
        {
            yield return (object)null;
            TestMsg.UpdatePositions();
        }
    }

    [HarmonyPatch]
    class TestMsgPatch
    {
        [HarmonyPostfix]
        [HarmonyPatch(typeof(OverlayPopup), "InitializeFrame")]
        protected static void InitializeFramePatchPostFix(TestMsg __instance)
        {
            if (__instance.GetType() != typeof(TestMsg)) return;

            VTFirstModeHarmonyMod.Logger.Log("===============================.");
            VTFirstModeHarmonyMod.Logger.Log("InitializeFramePatchPostFix.");
            VTFirstModeHarmonyMod.Logger.Log("===============================.");
            __instance._message = __instance.transform.AddUIChild("Message").AddComponent<UnityEngine.UI.Text>();
            __instance._message.font = R.Fonts.OpenSans.OpenSansRegular;
            __instance._message.color = Color.white;
            __instance.Padding = new RectOffset(15, 15, 8, 8);
        }
    }
}
```

Мы почти у цели. Скомпилируем наш мод нажатием кнопки <kbd>F6</kbd>. После компиляции доставьте мод в игру, но не спешите её запускать.

Теперь, если вы запустите игру, то у вас будет ошибка свзяанная с библиотекой `System.Collections`. Её просто нет в папке игры. Нам придется её положить в папку к своему моду, что бы он работал корректно. И так, вы можете найти требуемую библиотеку по следующему пути:

```console
C:\Windows\Microsoft.NET\Framework64\v4.0.30319
```

Его нужно положить в туже папку, где лежит ваш мод `VTFirstModeHarmony`

Теперь мы можем запустить игру и начать новую игру. По нажатию на праую кнопку мыши мы увидем сообщение `OverlayMessage` через класс `OverlayMessage`. При нажатии на левую кнопку мыши мы увидем сообщение `TextMsg` через класс `TextMsg`.

Спасибо за внимание. Удачной разработки!

