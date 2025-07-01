import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlacesFormScreen extends StatefulWidget {
  const PlacesFormScreen({super.key});

  @override
  State<PlacesFormScreen> createState() => _PlacesFormScreenState();
}

class _PlacesFormScreenState extends State<PlacesFormScreen> {
  final _titleController = TextEditingController();
  io.File? _storedImage;
  PlaceLocation? _pickedPosition;

  void _selectImage(io.File storedImage) {
    setState(() {
      _storedImage = storedImage;
    });
  }

  void _selectPosition(PlaceLocation pickedPosition) {
    setState(() {
      _pickedPosition = pickedPosition;
    });
  }

  bool _isValidForm() {
    return _titleController.text.isNotEmpty &&
        _storedImage != null &&
        _pickedPosition != null;
  }

  void _submitForm() {
    if (!_isValidForm()) return;

    Provider.of<GreatPlaces>(
      context,
      listen: false,
    ).addPlace(_titleController.text, _storedImage!, _pickedPosition!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Place')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  spacing: 10,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    ImageInput(onSelectImage: _selectImage),
                    LocationInput(onSelectPosition: _selectPosition),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _isValidForm() ? _submitForm : null,
            icon: Icon(Icons.add, size: 28, weight: 700),
            label: Text(
              'Add',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
              elevation: WidgetStateProperty.all<double>(0),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsetsGeometry.all(20),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondary,
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
