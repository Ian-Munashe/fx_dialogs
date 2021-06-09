import 'package:fxdialogs/src/widgets.dart';
import 'package:flutter/material.dart';

enum ProgressType { circular, linear }
enum DialogType { success, warning, error }

class FXDialog {
  // Building progress dialog.
  static progress(
    context, {
    double radius = 8,
    String subtitle = "Loading...",
    Color backgroundColor = Colors.white,
    TextStyle textStyle = const TextStyle(),
    Color progressIndicatorColor = Colors.blue,
    ProgressType progressType = ProgressType.circular,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => ProgressDialog(
          radius: radius,
          style: textStyle,
          subtitle: subtitle,
          progressType: progressType,
          backgroundColor: backgroundColor,
          progressIndicatorColor: progressIndicatorColor,
        ),
      );

  FXDialog(
    BuildContext context, {
    double radius = 8,
    Color buttonColor = Colors.blue,
    Color backgroundColor = Colors.white,
    TextStyle style = const TextStyle(),
    String message = "Custom dialog message",
    DialogType dialogType = DialogType.success,
    EdgeInsets padding = const EdgeInsets.all(12),
    TextStyle titleStyle = const TextStyle(fontSize: 18),
    BoxConstraints constraints = const BoxConstraints(maxWidth: 400),
    Function()? onConfirm,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => FXInfoDialog(
        style: style,
        radius: radius,
        message: message,
        padding: padding,
        onOkTap: onConfirm,
        titleStyle: titleStyle,
        dialogType: dialogType,
        buttonColor: buttonColor,
        constraints: constraints,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
