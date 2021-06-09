# fxdialogs

This flutter package provides designed dialog box with progress indicators.

## Simple Usage
To use this plugin, add `fxdialogs` as a
[dependency in your pubspec.yaml file](https://pub.dev/packages/fxdialogs/install).

### Implementation:

* Import `import 'package:fxdialogs/fxdialogs.dart';`

### Message Dialog

* use `FXDialog` widget to call the **Message Dialog** .

```
ElevatedButton(
    onPressed: () => FXDialog(
        context,
        dialogType: DialogType.success,
        message: "Custom Dialog message",
    ),
    child: Text("Open Success Dialog"),
),
```
### FX Progress indicator

* use `FXDialog.progress()` widget to choose your preferred **Progress Indicator** .

```
ElevatedButton(
    onPressed: () => FXDialog.progress(
        context,
        progressType: ProgressType.linear,
        subtitle: "Loading...",
    ),
    child: Text("Open Linear Progress Dialog"),
),
```

See the `example` directory for the complete sample app.

