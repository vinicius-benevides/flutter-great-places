import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function(PlaceLocation location) onSelectPosition;

  const LocationInput({super.key, required this.onSelectPosition});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();

    if (locationData.latitude == null || locationData.longitude == null) return;

    setState(() {
      _previewImageUrl = 'assets/images/map_template.png';
    });

    widget.onSelectPosition(
      PlaceLocation(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text('No location has been set')
              : Image.asset(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map_outlined),
              label: Text('Select on map'),
            ),
          ],
        ),
      ],
    );
  }
}
