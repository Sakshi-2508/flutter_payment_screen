import 'package:flutter/material.dart';

enum PaymentMethodType {
  upi,
  card,
  wallet,
  netBanking,
  cashOnDelivery,
}

class PaymentMethod {
  final PaymentMethodType type;
  final String title;
  final String subtitle;
  final IconData icon;

  const PaymentMethod({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  static const upi = PaymentMethod(
    type: PaymentMethodType.upi,
    title: 'UPI',
    subtitle: 'Pay using Google Pay, PhonePe, Paytm',
    icon: Icons.account_balance_wallet_outlined,
  );

  static const card = PaymentMethod(
    type: PaymentMethodType.card,
    title: 'Credit / Debit Card',
    subtitle: 'Visa, Mastercard, RuPay',
    icon: Icons.credit_card,
  );

  static const wallet = PaymentMethod(
    type: PaymentMethodType.wallet,
    title: 'Wallet',
    subtitle: 'Pay using wallet balance',
    icon: Icons.wallet_outlined,
  );

  static const netBanking = PaymentMethod(
    type: PaymentMethodType.netBanking,
    title: 'Net Banking',
    subtitle: 'All major banks supported',
    icon: Icons.account_balance_outlined,
  );

  static const cashOnDelivery = PaymentMethod(
    type: PaymentMethodType.cashOnDelivery,
    title: 'Cash on Delivery',
    subtitle: 'Pay when order arrives',
    icon: Icons.local_shipping_outlined,
  );
}