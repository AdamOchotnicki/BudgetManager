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
    print(dailyTransactions);
    return Card(
      elevation: 5,
      color: Theme.of(context).accentColor,
      //margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dailyTransactions.map((data) {
            //return Text('${data['day']}: ${data['amount']}');
            return Flexible(
              fit: FlexFit.tight,
              child: InkWell(
                child: ChartBar(
                  data['day'],
                  data['amount'],
                  lastWeekTotalExpenses == 0.0
                      ? 0.0
                      : (data['amount'] as double) / lastWeekTotalExpenses,
                ),
                onTap: () {
                  print('Tapped on ' '${data['day']}!');
                  Navigator.of(context)
                      .pushNamed(DailyTransactionsScreen.routeName);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
