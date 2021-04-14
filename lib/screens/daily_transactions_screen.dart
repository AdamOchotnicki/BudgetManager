import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../models/transaction.dart';
import '../widgets/transaction_list.dart';
import '../providers/user_transactions.dart';

class DailyTransactionsScreen extends StatelessWidget {
  static const routeName = '/daily-transactions';
  // final List<Transaction> transactions;

  // DailyTransactionsScreen(this.transactions);

  @override
  Widget build(BuildContext context) {
    // need to change to transactions on the selected day
    final transactionsData = Provider.of<UserTransactions>(context);
    final transactions = transactionsData.userTransactions;

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
