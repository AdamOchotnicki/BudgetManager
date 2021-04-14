import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_list.dart';

class DailyTransactionsScreen extends StatelessWidget {
  static const routeName = '/daily-transactions';

  @override
  Widget build(BuildContext context) {
    final transactions = ModalRoute.of(context).settings.arguments as List<Transaction>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily transactions'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: TransactionList(transactions),
            ),
          ),
        ],
      ),
    );
  }
}
