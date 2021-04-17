import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_transactions.dart';
import '../screens/home_page.dart';

class NewTransaction extends StatefulWidget {
  // final Function addTransaction;

  // NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final transactionsData = Provider.of<UserTransactions>(context);
    final addTransaction = transactionsData.addTransaction;

    void submitData() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      }

      addTransaction(enteredTitle, enteredAmount);
      Navigator.of(context).popAndPushNamed(HomePage.routeName);
      //Navigator.of(context).pushNamed(HomePage.routeName);
    }

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          height: 500,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text('No date chosen!'),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: submitData,
                child: Text('Add Transaction'),
                color: Theme.of(context).accentColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
