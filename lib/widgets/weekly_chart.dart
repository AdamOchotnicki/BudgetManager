import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_transactions.dart';

class WeeklyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userTransactions = Provider.of<UserTransactions>(context);
    final dailyTransactions = userTransactions.dailyTransactions;
    print(dailyTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: dailyTransactions.map((transactionsData) {
          return Text(
            '${transactionsData['day']}: ${transactionsData['amount']}',
          );
        }).toList(),
      ),
    );
  }
}
