import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Great Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.placeForm);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                builder: (ctx, greatPlaces, child) =>
                    greatPlaces.itemsCount == 0
                    ? child!
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.itemByIndex(i).image,
                            ),
                          ),
                          title: Text(greatPlaces.itemByIndex(i).title),
                          subtitle: Text(
                            greatPlaces.itemByIndex(i).location.address,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.placeDetail,
                              arguments: greatPlaces.itemByIndex(i),
                            );
                          },
                        ),
                      ),
                child: Center(child: Text('Register a place to get started!')),
              ),
      ),
    );
  }
}
