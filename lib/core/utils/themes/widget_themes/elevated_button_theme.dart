/* --- Light e Dark Elevated Button Themes ---*/
import 'package:flutter/material.dart';
import 'package:project_dog_zizzi/core/constants/colors.dart';

import '../../../constants/sizes.dart';

///Defines a consistent and centralized style for all elevated buttons (ElevatedButton) of the app, separating the style into light and dark themes.
///Example: elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

/* --- Light Theme --- */
static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: tWhiteColor,
    backgroundColor: tDarkColor,
    side: const BorderSide(color: tDarkColor),
    padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(tBorderRadius),
    )
  )
);

  /* --- Dark Theme --- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: tDarkColor,
      backgroundColor: tPrimaryColor,
      side: const BorderSide(color: tPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(tBorderRadius)),
    ),
  );

}