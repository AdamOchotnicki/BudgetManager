import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_transactions.dart';
import './chart_bar.dart';
import '../screens/daily_transactions_screen.dart';

class WeeklyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userTransactions = Provider.of<UserTransactions>(context);
    final dailyTransactions = userTransactions.dailyTransactions;
    final lastWeekTotalExpenses = userTransactions.lastWeekTotalExpenses;

    return Card(
      elevation: 5,
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dailyTransactions.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: InkWell(
                child: ChartBar(
                  data['day'],
                  data['amount'],
                  lastWeekTotalExpenses == 0.0 ? 0.0 : (data['amount'] as double) / lastWeekTotalExpenses,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    DailyTransactionsScreen.routeName,
                    arguments: data['transactions'],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
