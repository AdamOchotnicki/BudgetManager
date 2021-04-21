import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './test_transactions.dart';

class UserTransactions with ChangeNotifier {
  double _accountBalance = 567.34;
  List<Transaction> _userTransactions = TestTransactions().testTransactions;

  double get accountBalance {
    return _accountBalance;
  }

  // void updateBalance(double transactionAmount) {
  //   _accountBalance -= transactionAmount;
  // }

  // void addTransaction(Transaction newTransaction) {
  //   _userTransactions.add(newTransaction);
  //   updateBalance(newTransaction.amount);
  //   notifyListeners();
  // }

  void addTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: transactionTitle,
      amount: transactionAmount,
      dateTime: DateTime.now(),
    );

    _userTransactions.add(newTransaction);
    _accountBalance -= transactionAmount;
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

  // sum and list of transactions each day from _recentTransactions (last seven days)
  List<Map<String, Object>> get dailyTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double dailyTotal = 0.0;
      List<Transaction> transactionsOnThatDay = [];

      for (var transaction in _recentTransactions) {
        if (transaction.dateTime.day == weekDay.day && transaction.dateTime.month == weekDay.month && transaction.dateTime.year == weekDay.year) {
          dailyTotal += transaction.amount;
          transactionsOnThatDay.add(transaction);
        }
      }

      return {
        //'day': DateFormat.E().format(weekDay).substring(0, 1),
        'day': DateFormat.E().format(weekDay),
        'amount': dailyTotal,
        'transactions': transactionsOnThatDay,
      };
    }).reversed.toList();
  }

  // total expenses for the last week
  double get lastWeekTotalExpenses {
    return dailyTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }
}
