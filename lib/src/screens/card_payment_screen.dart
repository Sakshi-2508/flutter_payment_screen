import 'package:flutter/material.dart';

class CardPaymentScreen extends StatefulWidget {
  final double amount;
  final String currency;

  const CardPaymentScreen({
    super.key,
    required this.amount,
    this.currency = '₹',
  });

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final cardNumberController = TextEditingController();
  final cardHolderController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  bool saveCard = false;

  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  String get cardNumber {
    if (cardNumberController.text.isEmpty) {
      return '**** **** **** 4567';
    }
    return cardNumberController.text;
  }

  String get cardHolder {
    if (cardHolderController.text.isEmpty) {
      return 'CARD HOLDER';
    }
    return cardHolderController.text.toUpperCase();
  }

  String get expiry {
    if (expiryController.text.isEmpty) {
      return 'MM/YY';
    }
    return expiryController.text;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Card Payment'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 190,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF111827),
                  Color(0xFF2563EB),
                  Color(0xFF7C3AED),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2563EB).withValues(alpha: 0.28),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'VISA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.contactless_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  cardNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        cardHolder,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      expiry,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          _field(
            controller: cardNumberController,
            label: 'Card Number',
            hint: '1234 5678 9012 3456',
            icon: Icons.credit_card,
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 14),

          _field(
            controller: cardHolderController,
            label: 'Card Holder Name',
            hint: 'Christopher Baker',
            icon: Icons.person_outline,
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: _field(
                  controller: expiryController,
                  label: 'Expiry',
                  hint: 'MM/YY',
                  icon: Icons.calendar_month_outlined,
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _field(
                  controller: cvvController,
                  label: 'CVV',
                  hint: '123',
                  icon: Icons.lock_outline,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: SwitchListTile(
              value: saveCard,
              onChanged: (value) {
                setState(() => saveCard = value);
              },
              title: const Text(
                'Save card for future payments',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                elevation: 8,
                shadowColor: const Color(0xFF2563EB).withValues(alpha: 0.35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Pay ${widget.currency}${widget.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: isDark ? const Color(0xFF1E293B) : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
