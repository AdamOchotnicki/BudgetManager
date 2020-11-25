import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  static const routeName = '/add-transaction';

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _titleController = TextEditingController();

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
                    Container(),
                    SizedBox(height: 10),
                    Card(
                      elevation: 5,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Recognized text here!',
                        style: TextStyle(color: Theme.of(context).accentColor),
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
                icon: Icon(Icons.camera),
                label: Text('Take a picture'),
                color: Theme.of(context).accentColor,
              ),
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('Add manually'),
                color: Theme.of(context).accentColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
