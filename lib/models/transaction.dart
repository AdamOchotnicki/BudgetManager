import 'package:flutter/foundation.dart';
import 'dart:io';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final File image;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.dateTime,
    this.image,
  });
}
