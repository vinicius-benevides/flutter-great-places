import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  void _openMap(double latitude, double longitude) async {
    final url = Uri.parse(
      'http://maps.google.com/maps?z=12&t=m&q=loc:$latitude+$longitude',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)?.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Column(
        spacing: 10,
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Text(
            place.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          TextButton.icon(
            icon: Icon(Icons.map_outlined),
            label: Text('See on map'),
            onPressed: () =>
                _openMap(place.location.latitude, place.location.longitude),
          ),
        ],
      ),
    );
  }
}
