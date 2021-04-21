import '../models/transaction.dart';

class TestTransactions {
  List<Transaction> _testTransactions = [
    Transaction(
      id: 't1',
      title: 'SV - daily groceries',
      amount: 17.57,
      dateTime: DateTime(2021, 4, 15),
    ),
    Transaction(
      id: 't2',
      title: 'Coal',
      amount: 15.57,
      dateTime: DateTime(2021, 4, 15),
    ),
    Transaction(
      id: 't3',
      title: 'Slippers',
      amount: 25.07,
      dateTime: DateTime(2021, 4, 15),
    ),
    Transaction(
      id: 't4',
      title: 'T-shirt',
      amount: 20.99,
      dateTime: DateTime(2021, 4, 15),
    ),
    Transaction(
      id: 't5',
      title: 'T-shirt',
      amount: 25.99,
      dateTime: DateTime(2021, 4, 16),
    ),
    Transaction(
      id: 't6',
      title: 'Hoodie',
      amount: 50.99,
      dateTime: DateTime(2021, 4, 16),
    ),
    Transaction(
      id: 't7',
      title: 'Groceries',
      amount: 10.20,
      dateTime: DateTime(2021, 4, 16),
    ),
    Transaction(
      id: 't8',
      title: 'Kindling',
      amount: 10.00,
      dateTime: DateTime(2021, 4, 16),
    ),
    Transaction(
      id: 't9',
      title: 'Diesel',
      amount: 30.25,
      dateTime: DateTime(2021, 4, 16),
    ),
    Transaction(
      id: 't10',
      title: 'Groceries',
      amount: 45.68,
      dateTime: DateTime(2021, 4, 17),
    ),
    Transaction(
      id: 't11',
      title: 'Groceries',
      amount: 17.57,
      dateTime: DateTime(2021, 4, 18),
    ),
    Transaction(
      id: 't12',
      title: 'Diesel',
      amount: 25.43,
      dateTime: DateTime(2021, 4, 18),
    ),
    Transaction(
      id: 't13',
      title: 'Groceries',
      amount: 19.57,
      dateTime: DateTime(2021, 4, 19),
    ),
    Transaction(
      id: 't14',
      title: 'Groceries',
      amount: 35.57,
      dateTime: DateTime(2021, 4, 20),
    ),
    Transaction(
      id: 't15',
      title: 'Coal',
      amount: 150.00,
      dateTime: DateTime(2021, 4, 20),
    ),
    Transaction(
      id: 't16',
      title: 'Groceries',
      amount: 4.57,
      dateTime: DateTime(2021, 4, 20),
    ),
    Transaction(
      id: 't17',
      title: 'New shoes',
      amount: 69.99,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 't18',
      title: 'Groceries',
      amount: 130.59,
      dateTime: DateTime.now(),
    ),
  ];

  List<Transaction> get testTransactions {
    return [..._testTransactions];
  }
}
