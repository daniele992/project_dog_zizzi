import 'package:flutter/material.dart';
import 'package:project_dog_zizzi/core/utils/themes/widget_themes/appbar_theme.dart';
import 'package:project_dog_zizzi/core/utils/themes/widget_themes/elevated_button_theme.dart';
import 'package:project_dog_zizzi/core/utils/themes/widget_themes/outlined_button_theme.dart';
import 'package:project_dog_zizzi/core/utils/themes/widget_themes/text_field_theme.dart';
import 'package:project_dog_zizzi/core/utils/themes/widget_themes/text_theme.dart';

///Defines the light and dark themes of your Flutter app in a centralized way.
class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutLinedButtonTheme,
  );
}