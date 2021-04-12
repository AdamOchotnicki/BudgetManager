import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class WeeklyChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  WeeklyChart(this.recentTransactions);

  List<Map<String, Object>> get dailyTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double dailyTotal = 0.0;

      for (var transaction in recentTransactions) {
        if (transaction.dateTime.day == weekDay.day &&
            transaction.dateTime.month == weekDay.month &&
            transaction.dateTime.year == weekDay.year) {
          dailyTotal += transaction.amount;
        }
      }

      // print(DateFormat.E(weekDay));
      // print(dailyTotal);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': dailyTotal,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
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
