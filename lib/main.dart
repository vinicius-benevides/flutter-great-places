import 'package:flutter/material.dart';
import 'package:greate_places/screens/placeS_list_screen.dart';
import 'package:greate_places/screens/places_form_screen.dart';
import 'package:greate_places/styles/main_theme.dart';
import 'package:greate_places/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greate Places',
      debugShowCheckedModeBanner: false,
      theme: mainTheme(context),
      routes: {
        AppRoutes.home: (ctx) => const PlacesListScreen(),
        AppRoutes.placeForm: (ctx) => const PlacesFormScreen(),
      },
    );
  }
}
