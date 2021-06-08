import 'package:flutter/cupertino.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter FXDialogs Example.")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => FXDialog(
            context,
            dialogType: DialogType.success,
            message: "Custom Dialog message",
          ),
          child: Text("Success Dialog"),
        ),
      ),
    );
  }
}
