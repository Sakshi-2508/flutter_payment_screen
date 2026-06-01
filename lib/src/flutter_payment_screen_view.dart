import 'package:flutter/material.dart';
import 'package:flutter_payment_screen/src/screens/card_payment_screen.dart';
import 'package:flutter_payment_screen/src/screens/cash_on_delivery_screen.dart';
import 'package:flutter_payment_screen/src/screens/upi_payment_screen.dart';
import 'package:flutter_payment_screen/src/screens/wallet_payment_screen.dart';
import 'payment_method.dart';
import 'payment_method_tile.dart';
import 'order_summary_card.dart';
import 'coupon_field.dart';


class FlutterPaymentScreen extends StatefulWidget {
  final String title;
  final double amount;
  final String currency;
  final List<PaymentMethod> paymentMethods;
  final ValueChanged<PaymentMethod>? onPaymentMethodChanged;
  final VoidCallback? onPay;

  const FlutterPaymentScreen({
    super.key,
    this.title = 'Complete Payment',
    required this.amount,
    this.currency = '₹',
    this.paymentMethods = const [
      PaymentMethod.upi,
      PaymentMethod.card,
      PaymentMethod.wallet,
      PaymentMethod.cashOnDelivery,
    ],
    this.onPaymentMethodChanged,
    this.onPay,
  });

  @override
  State<FlutterPaymentScreen> createState() => _FlutterPaymentScreenState();
}

class _FlutterPaymentScreenState extends State<FlutterPaymentScreen> {
  late PaymentMethod selectedMethod;

  @override
  void initState() {
    super.initState();
    selectedMethod = widget.paymentMethods.first;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: isDark ? Colors.white : Colors.black,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _AmountCard(amount: widget.amount, currency: widget.currency),
          const SizedBox(height: 24),

          Text(
            'Choose Payment Method',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),

          ...widget.paymentMethods.map(
            (method) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: PaymentMethodTile(
                method: method,
                isSelected: selectedMethod.type == method.type,
                onTap: () {
                  if (method.type == PaymentMethodType.upi) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UpiPaymentScreen(
                          amount: widget.amount,
                          currency: widget.currency,
                        ),
                      ),
                    );
                    return;
                  }

                  if (method.type == PaymentMethodType.card) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CardPaymentScreen(
                          amount: widget.amount,
                          currency: widget.currency,
                        ),
                      ),
                    );
                    return;
                  }

                  if (method.type == PaymentMethodType.wallet) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WalletPaymentScreen(
                          amount: widget.amount,
                          currency: widget.currency,
                        ),
                      ),
                    );
                    return;
                  }

                  if (method.type == PaymentMethodType.cashOnDelivery) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CashOnDeliveryScreen(
                          amount: widget.amount,
                          currency: widget.currency,
                        ),
                      ),
                    );
                    return;
                  }

                  setState(() => selectedMethod = method);
                  widget.onPaymentMethodChanged?.call(method);
                },
              ),
            ),
          ),

          const SizedBox(height: 24),

          OrderSummaryCard(
            subtotal: widget.amount,
            discount: 50,
            deliveryFee: 20,
            tax: 10,
            currency: widget.currency,
          ),

          const SizedBox(height: 16),

          CouponField(
            onApply: () {
              debugPrint('Coupon Applied');
            },
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: widget.onPay,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(
                'Pay ${widget.currency}${widget.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmountCard extends StatelessWidget {
  final double amount;
  final String currency;

  const _AmountCard({required this.amount, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2563EB).withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Total Amount',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$currency${amount.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Secure checkout',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
