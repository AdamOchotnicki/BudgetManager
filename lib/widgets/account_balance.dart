import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/user_transactions.dart';

class AccountBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionsData = Provider.of<UserTransactions>(context);
    final balance = transactionsData.accountBalance;
    return Card(
      elevation: 5,
      color: Theme.of(context).accentColor,
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
    );
  }
}
