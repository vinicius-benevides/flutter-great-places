import 'package:flutter/material.dart';
import 'package:greate_places/utils/custom_route.dart';

ThemeData mainTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.light(primary: Colors.indigo),
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
