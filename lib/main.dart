import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/user_transactions.dart';
import './screens/home_page.dart';
import './screens/add_transaction_screen.dart';

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
        routes: {
          //HomePage.routeName: (ctx) => HomePage(title: 'Budget manager'),
          AddTransactionScreen.routeName: (ctx) => AddTransactionScreen(),
        },
      ),
    );
  }
}
