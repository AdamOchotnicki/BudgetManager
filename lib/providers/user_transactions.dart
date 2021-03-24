import 'package:flutter/foundation.dart';

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

  List<Transaction> get userTransactions {
    return [..._userTransactions];
  }

  void updateBalance(double transactionAmount) {
    _accountBalance -= transactionAmount;
  }

  void addTransaction(Transaction newTransaction) {
    _userTransactions.add(newTransaction);
    updateBalance(newTransaction.amount);
    notifyListeners();
  }
}
