import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class LocationCard extends StatelessWidget {
  const LocationCard(this.place, {super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(place.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Icon(Icons.delete, color: Colors.white, size: 40),
      ),
      onDismissed: (_) {
        Provider.of<GreatPlaces>(context, listen: false).removePlace(place.id);
      },
      child: ListTile(
        leading: Hero(
          tag: place.id,
          child: CircleAvatar(backgroundImage: FileImage(place.image)),
        ),
        title: Text(place.title),
        subtitle: Text(place.location.address),
        onTap: () {
          Navigator.of(
            context,
          ).pushNamed(AppRoutes.placeDetail, arguments: place);
        },
      ),
    );
  }
}
