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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: place.id,
                    child: Image.file(place.image, fit: BoxFit.cover),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      color: Colors.black26,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        place.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  place.location.address,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey[800]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton.icon(
                  icon: Icon(Icons.map_outlined),
                  label: Text('See on map'),
                  onPressed: () => _openMap(
                    place.location.latitude,
                    place.location.longitude,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
