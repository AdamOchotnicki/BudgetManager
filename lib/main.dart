import 'package:flutter/material.dart';
//import 'dart:io';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Budget manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'SV - daily groceries',
      amount: 17.57,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New shoes',
      amount: 69.99,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'LIDL - weekly groceries',
      amount: 130.59,
      dateTime: DateTime.now(),
    ),
  ];

  //double accountBalance = 567.34;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5,
                color: Colors.red,
                child: Text('ACCOUNT BALANCE!'),
              ),
              Card(
                elevation: 5,
                color: Colors.blue,
                child: Text('CHART!'),
              ),
            ],
          ),
          Column(
            children: widget.transactions.map((transaction) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(transaction.amount.toString()),
                    ),
                    Column(
                      children: [
                        Text(transaction.title),
                        Text(transaction.dateTime.toString()),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
