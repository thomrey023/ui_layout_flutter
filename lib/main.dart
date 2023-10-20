import 'package:flutter/material.dart';
import 'package:ui_layout_flutter/views/screens/credit_ledger_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreditLedgerScreen(title: 'CREDIT LEDGER'),
    );
  }
}
