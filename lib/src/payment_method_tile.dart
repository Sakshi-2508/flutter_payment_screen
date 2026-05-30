import 'package:flutter/material.dart';
import 'payment_method.dart';

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethod method;
  final bool isSelected;
  final VoidCallback? onTap;

  const PaymentMethodTile({
    super.key,
    required this.method,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF2563EB) : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        leading: CircleAvatar(
          backgroundColor: isSelected
              ? const Color(0xFF2563EB)
              : const Color(0xFFEFF6FF),
          child: Icon(
            method.icon,
            color: isSelected ? Colors.white : const Color(0xFF2563EB),
          ),
        ),
        title: Text(
          method.title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(method.subtitle),
        trailing: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isSelected
              ? const Icon(
                  Icons.check_circle,
                  key: ValueKey('selected'),
                  color: Color(0xFF2563EB),
                )
              : const Icon(
                  Icons.radio_button_unchecked,
                  key: ValueKey('unselected'),
                  color: Colors.grey,
                ),
        ),
      ),
    );
  }
}
