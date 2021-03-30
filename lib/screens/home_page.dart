import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/account_balance.dart';
import '../widgets/transaction_list.dart';
import '../screens/add_transaction_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // double _accountBalance = 567.34;
  // final List<Transaction> _userTransactions = [
  //   Transaction(
  //     id: 't1',
  //     title: 'SV - daily groceries',
  //     amount: 17.57,
  //     dateTime: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'New shoes',
  //     amount: 69.99,
  //     dateTime: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't3',
  //     title: 'LIDL - weekly groceries',
  //     amount: 130.59,
  //     dateTime: DateTime.now(),
  //   ),
  // ];

  void _addNewTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: transactionTitle,
      amount: transactionAmount,
      dateTime: DateTime.now(),
    );

    // setState(() {
    //   _userTransactions.add(newTransaction);
    //   _accountBalance -= transactionAmount;
    // });
  }

  void _startAddingNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //AccountBalance(_accountBalance),
                AccountBalance(),
                Card(
                  elevation: 5,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'WEEKLY CHART!',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
            //NewTransaction(_addNewTransaction),
            //TransactionList(_userTransactions),
            TransactionList(),
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //onPressed: () => _startAddingNewTransaction(context),
        onPressed: () {
          Navigator.of(context).pushNamed(AddTransactionScreen.routeName);
        },
      ),
    );
  }
}
