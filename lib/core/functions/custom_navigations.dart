import 'package:flutter/material.dart';

void navigateReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

void navigationPush(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}
