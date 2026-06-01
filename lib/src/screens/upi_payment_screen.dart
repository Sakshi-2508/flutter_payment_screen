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

  final TextEditingController upiController = TextEditingController();

  final List<Map<String, dynamic>> apps = [
    {'name': 'Google Pay', 'icon': Icons.g_mobiledata},
    {'name': 'PhonePe', 'icon': Icons.phone_android},
    {'name': 'Paytm', 'icon': Icons.account_balance_wallet_outlined},
    {'name': 'BHIM', 'icon': Icons.currency_rupee},
  ];

  @override
  void dispose() {
    upiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('UPI Payment'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                const Text('Amount To Pay', style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 10),
                Text(
                  '${widget.currency}${widget.amount.toStringAsFixed(2)}',
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),

          ...apps.map((app) {
            final isSelected = selectedApp == app['name'];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  setState(() => selectedApp = app['name']);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E293B) : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF2563EB) : Colors.transparent,
                      width: 1.6,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: isDark ? 0.18 : 0.06),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: isSelected
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFEFF6FF),
                        child: Icon(
                          app['icon'],
                          color: isSelected ? Colors.white : const Color(0xFF2563EB),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          app['name'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Icon(
                        isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                        color: isSelected ? const Color(0xFF2563EB) : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 20),
          const Text(
            'Enter UPI ID',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: upiController,
            decoration: InputDecoration(
              hintText: 'example@upi',
              prefixIcon: const Icon(Icons.alternate_email),
              filled: true,
              fillColor: isDark ? const Color(0xFF1E293B) : Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 55,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.verified_outlined),
              label: const Text('Verify UPI ID'),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(
                'Pay ${widget.currency}${widget.amount.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}