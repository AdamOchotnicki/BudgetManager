import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../providers/user_transactions.dart';

class AccountBalance extends StatelessWidget {
  final amountController = TextEditingController();

  void submitData(Function addToBalance) {
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0) {
      return;
    }

    addToBalance(enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    final transactionsData = Provider.of<UserTransactions>(context);
    final balance = transactionsData.accountBalance;
    final updateBalance = transactionsData.updateBalance;
    return Card(
      elevation: 5,
      color: Theme.of(context).accentColor,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '€${balance.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Account Balance',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Amount'),
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          onSubmitted: (_) => submitData(updateBalance),
                        ),
                        RaisedButton(
                          onPressed: () {
                            submitData(updateBalance);
                            Navigator.of(context).pop();
                          },
                          child: Text('Add Amount'),
                          color: Theme.of(context).accentColor,
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
