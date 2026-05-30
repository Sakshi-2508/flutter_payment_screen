import 'package:flutter/material.dart';
import 'package:flutter_payment_screen/flutter_payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterPaymentScreen(
        amount: 499,
        onPay: () {
          debugPrint('Payment Clicked');
        },
      ),
    );
  }
}