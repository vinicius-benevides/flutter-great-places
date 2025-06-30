import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:greate_places/providers/greate_places.dart';
import 'package:greate_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class PlacesFormScreen extends StatefulWidget {
  const PlacesFormScreen({super.key});

  @override
  State<PlacesFormScreen> createState() => _PlacesFormScreenState();
}

class _PlacesFormScreenState extends State<PlacesFormScreen> {
  final _titleController = TextEditingController();
  io.File? _storedImage;

  void _selectImage(io.File storedImage) {
    setState(() {
      _storedImage = storedImage;
    });
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _storedImage == null) return;

    Provider.of<GreatePlaces>(
      context,
      listen: false,
    ).addPlace(_titleController.text, _storedImage!);

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
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _submitForm,
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
