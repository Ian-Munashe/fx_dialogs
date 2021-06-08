import 'package:fxdialogs/src/widgets.dart';
import 'package:flutter/material.dart';

enum DialogType { success, warning, error }

class FXDialog {
  // Building progress dialog.
  static progress(
    context, {
    String subtitle = "Loading...",
    double radius = 8,
    Color backgroundColor = Colors.white,
    Color progressIndicatorColor = Colors.blue,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => ProgressDialog(
          radius: radius,
          subtitle: subtitle,
          style: const TextStyle(),
          backgroundColor: backgroundColor,
          progressIndicatorColor: progressIndicatorColor,
        ),
      );

  FXDialog(
    BuildContext context, {
    double radius = 8,
    Color buttonColor = Colors.blue,
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
      ),
    );
  }
}
