import 'package:flutter/material.dart';

class UpiPaymentScreen extends StatefulWidget {
  final double amount;
  final String currency;

  const UpiPaymentScreen({
    super.key,
    required this.amount,
    this.currency = '₹',
  });

  @override
  State<UpiPaymentScreen> createState() => _UpiPaymentScreenState();
}

class _UpiPaymentScreenState extends State<UpiPaymentScreen> {
  String selectedApp = 'Google Pay';

  final TextEditingController upiController =
      TextEditingController();

  final List<String> apps = [
    'Google Pay',
    'PhonePe',
    'Paytm',
    'BHIM',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),

      appBar: AppBar(
        title: const Text('UPI Payment'),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2563EB),
                  Color(0xFF7C3AED),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                const Text(
                  'Amount To Pay',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${widget.currency}${widget.amount}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Select UPI App',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 14),

          ...apps.map(
            (app) => RadioListTile<String>(
              value: app,
              groupValue: selectedApp,
              title: Text(app),
              onChanged: (value) {
                setState(() {
                  selectedApp = value!;
                });
              },
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Enter UPI ID',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: upiController,
            decoration: InputDecoration(
              hintText: 'example@upi',
              prefixIcon:
                  const Icon(Icons.alternate_email),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(16),
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Verify UPI ID',
              ),
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF2563EB),
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Pay ${widget.currency}${widget.amount}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}