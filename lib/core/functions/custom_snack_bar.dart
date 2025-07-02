import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
  BuildContext context,
  String error, {
  Color? backgroundColor,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(error),
      backgroundColor: backgroundColor ?? Colors.green,
    ),
  );
}
