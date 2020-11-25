import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

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
        RaisedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.camera),
          label: Text('Take a picture'),
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
