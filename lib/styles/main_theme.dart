import 'package:flutter/material.dart';
import 'package:great_places/utils/custom_route.dart';

ThemeData mainTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.indigo,
      secondary: Colors.amber,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionsBuilder(),
        TargetPlatform.iOS: CustomPageTransitionsBuilder(),
        TargetPlatform.windows: CustomPageTransitionsBuilder(),
      },
    ),
  );
}
