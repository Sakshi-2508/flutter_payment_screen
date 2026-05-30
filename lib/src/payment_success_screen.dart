import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onContinue;

  const PaymentSuccessScreen({
    super.key,
    this.title = 'Payment Successful',
    this.message = 'Your payment has been completed successfully.',
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFDCFCE7),
                child: Icon(Icons.check, size: 50, color: Colors.green),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(message, textAlign: TextAlign.center),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: onContinue,
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
