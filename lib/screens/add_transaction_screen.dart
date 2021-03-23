import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import '../widgets/image_input.dart';

class AddTransactionScreen extends StatefulWidget {
  static const routeName = '/add-transaction';

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;
  String _recognizedText;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
    _extractText(_pickedImage);
  }

  void _extractText(File image) async {
    // create FirebaseVisionImage
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);

    // create an instance of a detector
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    //final TextRecognizer cloudTextRecognizer = FirebaseVision.instance.cloudTextRecognizer();

    // call detectInImage() or processImage() with visionImage
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);
    //final VisionText visionText = await cloudTextRecognizer.processImage(visionImage);

    print(visionText.text);
    setState(() {
      _recognizedText = visionText.text;
    });

    // extract data
    // text
    // String text = visionText.text;
    // for (TextBlock block in visionText.blocks) {
    //   final Rect boundingBox = block.boundingBox;
    //   final List<Offset> cornerPoints = block.cornerPoints;
    //   final String text = block.text;
    //   final List<RecognizedLanguage> languages = block.recognizedLanguages;

    //   for (TextLine line in block.lines) {
    //     // Same getters as TextBlock
    //     for (TextElement element in line.elements) {
    //       // Same getters as TextBlock
    //     }
    //   }
    // }

    // document text
    // String text = visionDocumentText.text;
    // for (DocumentTextBlock block in visionDocumentText.blocks) {
    //   final Rect boundingBox = block.boundingBox;
    //   final String text = block.text;
    //   final List<RecognizedLanguage> languages = block.recognizedLanguages;
    //   final DocumentTextRecognizedBreak = block.recognizedBreak;

    //   for (DocumentTextParagraph paragraph in block.paragraphs) {
    //     // Same getters as DocumentTextBlock
    //     for (DocumentTextWord word in paragraph.words) {
    //       // Same getters as DocumentTextBlock
    //       for (DocumentTextSymbol symbol in word.symbols) {
    //         // Same getters as DocumentTextBlock
    //       }
    //     }
    //   }
    // }
  }

  void _saveImage() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      // show dialog
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new transaction'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10),
                    ImageInput(_selectImage),
                    SizedBox(height: 10),
                    Card(
                      elevation: 5,
                      color: Theme.of(context).primaryColor,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          _recognizedText == null
                              ? 'Recognized text here!'
                              : _recognizedText,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add_circle),
                label: Text('Add this transaction'),
                color: Theme.of(context).accentColor,
              ),
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add_comment),
                label: Text('Add manually'),
                color: Theme.of(context).accentColor,
              ),
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: Icon(Icons.add_circle),
              //   label: Text('Add this transaction'),
              //   style: ElevatedButton.styleFrom(
              //     primary: Theme.of(context).accentColor,
              //     onPrimary: Colors.black,
              //   ),
              // ),
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: Icon(Icons.add_comment),
              //   label: Text('Add manually'),
              //   style: ElevatedButton.styleFrom(
              //     primary: Theme.of(context).accentColor,
              //     onPrimary: Colors.black,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
