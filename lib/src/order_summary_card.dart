import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  final double subtotal;
  final double discount;
  final double deliveryFee;
  final double tax;
  final String currency;

  const OrderSummaryCard({
    super.key,
    required this.subtotal,
    this.discount = 0,
    this.deliveryFee = 0,
    this.tax = 0,
    this.currency = '₹',
  });

  

  double get total => subtotal - discount + deliveryFee + tax;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.18 : 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _row('Subtotal', subtotal),
          _row('Discount', -discount),
          _row('Delivery Fee', deliveryFee),
          _row('Tax', tax),
          const Divider(height: 28),
          _row('Total', total, isTotal: true),
        ],
      ),
    );
  }

  Widget _row(String label, double value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            '$currency${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.w900 : FontWeight.w600,
              color: isTotal ? const Color(0xFF2563EB) : null,
            ),
          ),
        ],
      ),
    );
  }
}
