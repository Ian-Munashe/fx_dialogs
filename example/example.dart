import 'package:flutter/material.dart';
import 'package:fxdialogs/fxdialogs.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() async {
    super.initState();

    /// Checks for an app update on app init state.
    final newVersion = FXNewVersion();
    final status = await newVersion.getVersionStatus();
    newVersion.showUpdateDialog(
      context: context,
      versionStatus: status!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter FXDialogs Example.")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Opening a dialog to show custom message.
          ElevatedButton(
            onPressed: () => FXDialog(
              context,
              dialogType: DialogType.success,
              message: "Custom Dialog message",
            ),
            child: Text("Open Success Dialog"),
          ),

          // Opening and show user linear progress indicator.
          ElevatedButton(
            onPressed: () => FXDialog.progress(
              context,
              progressType: ProgressType.linear,
              subtitle: "Loading...",
            ),
            child: Text("Open Linear Progress Dialog"),
          ),
        ],
      ),
    );
  }
}
