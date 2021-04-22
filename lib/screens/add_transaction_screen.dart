import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
//import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../widgets/new_transaction.dart';
//import '../providers/user_transactions.dart';

class AddTransactionScreen extends StatefulWidget {
  static const routeName = '/add-transaction';

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;
  String _recognizedText;
  String _extractedTotalValue;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
    _extractText(_pickedImage);
  }

  void _extractText(File image) async {
    // create FirebaseVisionImage
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);

    // create an instance of a detector
    final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    //final TextRecognizer cloudTextRecognizer = FirebaseVision.instance.cloudTextRecognizer();

    // call detectInImage() or processImage() with visionImage
    final VisionText visionText = await textRecognizer.processImage(visionImage);
    //final VisionText visionText = await cloudTextRecognizer.processImage(visionImage);

    print(visionText.text);
    setState(() {
      _recognizedText = visionText.text;
      _extractedTotalValue = _extractTotalValue(_recognizedText);
    });
  }

  String _extractTotalValue(String input) {
    String extractedValue = null;
    String proc = null;
    bool sentinel = true; // run loop while sentinel is true

    proc = input.replaceAll(' ', '').toLowerCase();
    print(proc);

    //do {
    int index;
    String procToWork;
    print(procToWork);

    if (procToWork == null) {
      procToWork = proc;
    }

    index = procToWork.indexOf('eft');
    print(index);

    if (index == -1) {
      sentinel = false;
      extractedValue = 'No value recognized';
    } else {
      index += 6;
      procToWork = procToWork.substring(index);
      //String temp = procToWork.substring(0, (procToWork.indexOf('.') + 3));
      String temp = procToWork.replaceAll('e', '');
      temp = temp.replaceAll('€', '');
      temp = temp.substring(0, (procToWork.indexOf('.') + 3));

      try {
        double value = double.parse(temp);
        extractedValue = value.toString();
        sentinel = false;
      } catch (e) {}
    }
    //} while (sentinel);

    return extractedValue;
  }

  void _startAddingNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction();
      },
    );
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
                          _recognizedText == null ? 'Recognized text here!' : _recognizedText,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      elevation: 5,
                      color: Theme.of(context).primaryColor,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          _extractedTotalValue == null ? 'Recognized value here!' : _extractedTotalValue,
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
                //onPressed: () {},
                onPressed: () => _startAddingNewTransaction(context),
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
