import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 700,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No image yet'),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          child: RaisedButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text('Take a picture'),
            color: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
