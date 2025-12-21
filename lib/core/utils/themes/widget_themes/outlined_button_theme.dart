import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

///This class defines the styles for all outline buttons (OutlinedButton) in the app, with two distinct variants for light and dark themes.
class TOutlinedButtonTheme{
  TOutlinedButtonTheme._(); //To avoid creating instances

  /* --- Light Theme --- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: tSecondaryColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(tBorderRadius)),
    ),
  );

  /* --- Dark Theme --- */
  static final darkOutLinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: tWhiteColor,
      side: const BorderSide(color: tWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(tBorderRadius)),
    ),
  );

}