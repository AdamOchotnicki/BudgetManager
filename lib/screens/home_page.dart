import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../models/transaction.dart';
//import '../widgets/new_transaction.dart';
import '../widgets/account_balance.dart';
import '../widgets/transaction_list.dart';
import './add_transaction_screen.dart';
import '../widgets/weekly_chart.dart';
import '../providers/user_transactions.dart';
//import './daily_transactions_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void _addNewTransaction(String transactionTitle, double transactionAmount) {
  //   final newTransaction = Transaction(
  //     id: DateTime.now().toString(),
  //     title: transactionTitle,
  //     amount: transactionAmount,
  //     dateTime: DateTime.now(),
  //   );

  //   // setState(() {
  //   //   _userTransactions.add(newTransaction);
  //   //   _accountBalance -= transactionAmount;
  //   // });
  // }

  // void _startAddingNewTransaction(BuildContext ctx) {
  //   showModalBottomSheet(
  //     context: ctx,
  //     builder: (_) {
  //       return NewTransaction(_addNewTransaction);
  //     },
  //   );
  // }

  // // string processing test
  // String testString =
  //     '    7 38 89 fn su dwTT LL857 b U   Total :   125.56 d9m,d-;oas88d      ';
  // String newString;

  // String processString(String input) {
  //   String output;
  //   String proc;
  //   bool sentinel = true; // run loop while sentinel is true

  //   // void _extractValue() {
  //   //   index
  //   //   proc.
  //   // }

  //   proc = input.replaceAll(' ', '').toLowerCase();
  //   print(proc);

  //   do {
  //     int index;
  //     String procToWork;
  //     print(procToWork);

  //     if (procToWork == null) {
  //       procToWork = proc;
  //     }

  //     index = procToWork.indexOf('total:');
  //     print(index);

  //     if (index == -1) {
  //       sentinel = false;
  //       output = 'No value recognized';
  //     } else {
  //       index += 6;
  //       procToWork = procToWork.substring(index);
  //       String temp = procToWork.substring(0, (procToWork.indexOf('.') + 3));

  //       try {
  //         double value = double.parse(temp);
  //         output = value.toString();
  //         sentinel = false;
  //       } catch (e) {}
  //     }
  //   } while (sentinel);

  //   return output;
  // }

  @override
  Widget build(BuildContext context) {
    final transactionsData = Provider.of<UserTransactions>(context);
    final transactions = transactionsData.userTransactions;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AccountBalance(),
                      WeeklyChart(),
                    ],
                  ),
                  //NewTransaction(_addNewTransaction),
                  //TransactionList(_userTransactions),
                  TransactionList(transactions),
                ],
              ),
            ),
          ),
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //onPressed: () => _startAddingNewTransaction(context),
        onPressed: () {
          Navigator.of(context).pushNamed(AddTransactionScreen.routeName);
          //Navigator.of(context).pushNamed(DailyTransactionsScreen.routeName);
          // newString = processString(testString);
          // print(newString);
        },
      ),
    );
  }
}
