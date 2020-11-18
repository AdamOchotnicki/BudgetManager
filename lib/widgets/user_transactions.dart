import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: transactionTitle,
      amount: transactionAmount,
      dateTime: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
