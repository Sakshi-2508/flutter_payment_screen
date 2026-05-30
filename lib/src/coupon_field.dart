import 'package:flutter/material.dart';

class CouponField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String buttonText;
  final VoidCallback? onApply;

  const CouponField({
    super.key,
    this.controller,
    this.hintText = 'Enter coupon code',
    this.buttonText = 'Apply',
    this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.18 : 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: const Icon(Icons.local_offer_outlined),
                border: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(onPressed: onApply, child: Text(buttonText)),
        ],
      ),
    );
  }
}
