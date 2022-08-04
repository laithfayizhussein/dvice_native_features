import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/user_places_provider.dart';

import '../widgets/image_input.dart';

class AddPlace extends StatefulWidget {
  static const String routeName = 'AddPlace';
  const AddPlace({Key? key}) : super(key: key);

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _whenClickAddPlace() {
    print('0///////////////////////////////////');
    if (_titleController.text.isEmpty || _pickedImage == null) {
      print(_pickedImage);
      print(_titleController.text);
      print('truetruetruetruetruetruetruetrue');
      return;
    }
    // here i use the provider to pass the value here in this page to add it in the placeList
    Provider.of<UserPlaces>(context, listen: false)
        .addPlaceToList(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add anew place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ImageInput(_selectImage) //widget folder
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
              onPressed: _whenClickAddPlace,
              icon: Icon(Icons.add),
              label: Text('AddPlace'),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                  elevation: 0, // remove the shadow,
                  tapTargetSize: MaterialTapTargetSize
                      .shrinkWrap) // remove the space on the end of the screen),
              )
        ],
      ),
    );
  }
}
