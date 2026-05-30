import 'package:flutter/material.dart';

class PaymentFailedScreen extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const PaymentFailedScreen({
    super.key,
    this.title = 'Payment Failed',
    this.message = 'Something went wrong while processing your payment.',
    this.onRetry,
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
                backgroundColor: Color(0xFFFEE2E2),
                child: Icon(Icons.close, size: 50, color: Colors.red),
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
                onPressed: onRetry,
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 