import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as pathPackage;
import 'package:path_provider/path_provider.dart' as pathProviderPackage;

class ImageInput extends StatefulWidget {
  final Function passImage;
  ImageInput(this.passImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  // this part for taking an image
  Future<void> _takePicture() async {
    PickedFile? pickedFile = await ImagePicker.platform
        .pickImage(source: ImageSource.camera, maxWidth: 600, maxHeight: 600);
    if (pickedFile == null) {
      return;
    }
    // to store image as var
    final File file = File(pickedFile.path);
    final Directory directory =
        await pathProviderPackage.getApplicationDocumentsDirectory();
    final path = directory.path;
    final String fileName = pathPackage.basename(pickedFile.path);
    File newImage = await file.copy('$path/$fileName');
    setState(() {
      _storedImage = newImage;
    });
    widget.passImage(newImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'no image taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {
              _takePicture();
            },
            icon: Icon(Icons.camera),
            label: Text('Take picture'),
            style: TextButton.styleFrom(
                textStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary)),
          ),
        ),
      ],
    );
  }
}
