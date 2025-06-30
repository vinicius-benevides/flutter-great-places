import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/placeS_list_screen.dart';
import 'package:great_places/screens/places_form_screen.dart';
import 'package:great_places/styles/main_theme.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        debugShowCheckedModeBanner: false,
        theme: mainTheme(context),
        routes: {
          AppRoutes.home: (ctx) => const PlacesListScreen(),
          AppRoutes.placeForm: (ctx) => const PlacesFormScreen(),
        },
      ),
    );
  }
}
