import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'dart:io';

// import './models/transaction.dart';
// import './widgets/transaction_list.dart';
// import './widgets/new_transaction.dart';
// import './widgets/account_balance.dart';
import './providers/user_transactions.dart';
import './screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserTransactions(),
      child: MaterialApp(
        title: 'Budget Manager',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(title: 'Budget manager'),
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   final String title;

//   HomePage({Key key, this.title}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double _accountBalance = 567.34;
//   final List<Transaction> _userTransactions = [
//     Transaction(
//       id: 't1',
//       title: 'SV - daily groceries',
//       amount: 17.57,
//       dateTime: DateTime.now(),
//     ),
//     Transaction(
//       id: 't2',
//       title: 'New shoes',
//       amount: 69.99,
//       dateTime: DateTime.now(),
//     ),
//     Transaction(
//       id: 't3',
//       title: 'LIDL - weekly groceries',
//       amount: 130.59,
//       dateTime: DateTime.now(),
//     ),
//   ];

//   void _addNewTransaction(String transactionTitle, double transactionAmount) {
//     final newTransaction = Transaction(
//       id: DateTime.now().toString(),
//       title: transactionTitle,
//       amount: transactionAmount,
//       dateTime: DateTime.now(),
//     );

//     setState(() {
//       _userTransactions.add(newTransaction);
//       _accountBalance -= transactionAmount;
//     });
//   }

//   void _startAddingNewTransaction(BuildContext ctx) {
//     showModalBottomSheet(
//       context: ctx,
//       builder: (_) {
//         return NewTransaction(_addNewTransaction);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 AccountBalance(_accountBalance),
//                 Card(
//                   elevation: 5,
//                   color: Theme.of(context).primaryColor,
//                   child: Text(
//                     'WEEKLY CHART!',
//                     style: TextStyle(
//                       color: Theme.of(context).accentColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             //NewTransaction(_addNewTransaction),
//             TransactionList(_userTransactions),
//           ],
//         ),
//       ),
//       //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => _startAddingNewTransaction(context),
//       ),
//     );
//   }
// }
