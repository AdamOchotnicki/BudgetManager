import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class UserTransactions with ChangeNotifier {
  double _accountBalance = 567.34;
  List<Transaction> _userTransactions = [
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

  double get accountBalance {
    return _accountBalance;
  }

  void updateBalance(double transactionAmount) {
    _accountBalance -= transactionAmount;
  }

  void addTransaction(Transaction newTransaction) {
    _userTransactions.add(newTransaction);
    updateBalance(newTransaction.amount);
    notifyListeners();
  }

  List<Transaction> get userTransactions {
    return [..._userTransactions];
  }

  // transactions in the last seven days
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.dateTime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  // sum of transactions each day from _recentTransactions
  List<Map<String, Object>> get dailyTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double dailyTotal = 0.0;

      for (var transaction in _recentTransactions) {
        if (transaction.dateTime.day == weekDay.day &&
            transaction.dateTime.month == weekDay.month &&
            transaction.dateTime.year == weekDay.year) {
          dailyTotal += transaction.amount;
        }
      }

      // print(DateFormat.E(weekDay));
      // print(dailyTotal);

      return {
        //'day': DateFormat.E().format(weekDay).substring(0, 1),
        'day': DateFormat.E().format(weekDay),
        'amount': dailyTotal,
      };
    });
  }

  // total expenses for the last week
  double get lastWeekTotalExpenses {
    return dailyTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }
}
