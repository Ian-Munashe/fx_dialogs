import 'package:fxdialogs/src/fx_dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String? subtitle;
  final TextStyle? style;
  final Color? progressIndicatorColor;
  final Color? backgroundColor;
  final double? radius;
  final ProgressType? progressType;
  final double circularIndicatorStrokeWidth;

  const ProgressDialog({
    Key? key,
    this.style,
    this.radius,
    this.subtitle,
    this.progressType,
    this.backgroundColor,
    this.progressIndicatorColor,
    this.circularIndicatorStrokeWidth = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300),
          padding: const EdgeInsets.all(20.0),
          child: _buildProgressIndicator,
        ),
      );

  Widget get _buildProgressIndicator {
    switch (progressType) {
      case ProgressType.linear:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                progressIndicatorColor!,
              ),
            ),
            SizedBox(height: 12),
            Text(
              subtitle!,
              style: style,
            ),
          ],
        );
      default:
        return Row(
          children: [
            CircularProgressIndicator(
              strokeWidth: circularIndicatorStrokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(
                progressIndicatorColor!,
              ),
            ),
            SizedBox(width: 12),
            Text(
              subtitle!,
              style: style,
            ),
          ],
        );
    }
  }
}

class FXInfoDialog extends StatelessWidget {
  final String? message;
  final double? radius;
  final TextStyle? style;
  final Widget? lottieIcon;
  final EdgeInsets? padding;
  final bool? repeatAnimation;
  final TextStyle? titleStyle;
  final Color? buttonColor;
  final Color? backgroundColor;
  final DialogType? dialogType;
  final void Function()? onCancel;
  final void Function()? onConfirm;
  final BoxConstraints? constraints;
  final TextAlign textAlign;

  const FXInfoDialog({
    Key? key,
    this.style,
    this.radius,
    this.message,
    this.padding,
    this.onCancel,
    this.onConfirm,
    this.lottieIcon,
    this.titleStyle,
    this.dialogType,
    this.constraints,
    this.buttonColor,
    this.repeatAnimation,
    this.backgroundColor,
    required this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: this.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.radius!),
        ),
        child: Container(
          padding: this.padding!,
          width: MediaQuery.of(context).size.width * .7,
          constraints: this.constraints,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _renderDialogData[0],
                style: this.titleStyle,
              ),
              SizedBox(height: 10),
              lottieIcon ??
                  Icon(
                    _renderDialogData[1],
                    size: 60,
                    color: _renderDialogData[2],
                  ),
              SizedBox(height: 8),
              Text(
                this.message!,
                textAlign: this.textAlign,
                style: this.style,
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (this.dialogType == DialogType.warning)
                    _buildTextButton(
                      context,
                      title: "Cancel",
                      onPressed: this.onCancel ?? () => Navigator.pop(context),
                    ),
                  _buildTextButton(
                    context,
                    title: "Okay",
                    onPressed: this.onConfirm ?? () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  TextButton _buildTextButton(BuildContext context, {String title = "Button", Function()? onPressed}) => TextButton(
        child: Text(
          title,
          style: this.style!.apply(
                color: this.buttonColor,
              ),
        ),
        onPressed: onPressed,
      );

  List get _renderDialogData {
    switch (this.dialogType) {
      case DialogType.success:
        return ["Success", CupertinoIcons.checkmark_seal, Colors.green.shade500];
      case DialogType.warning:
        return ["Warning", CupertinoIcons.exclamationmark_triangle, Colors.yellow.shade700];
      default:
        return ["Error!", CupertinoIcons.exclamationmark_circle, Colors.red];
    }
  }
}
