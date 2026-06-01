import 'package:flutter/material.dart';

class WalletPaymentScreen extends StatefulWidget {
  final double amount;
  final String currency;

  const WalletPaymentScreen({
    super.key,
    required this.amount,
    this.currency = '₹',
  });

  @override
  State<WalletPaymentScreen> createState() => _WalletPaymentScreenState();
}

class _WalletPaymentScreenState extends State<WalletPaymentScreen> {
  String selectedWallet = 'Paytm Wallet';

  final wallets = const [
    {
      'name': 'Paytm Wallet',
      'balance': '₹1,250',
      'icon': Icons.account_balance_wallet,
    },
    {
      'name': 'Amazon Pay',
      'balance': '₹780',
      'icon': Icons.shopping_bag_outlined,
    },
    {'name': 'Mobikwik', 'balance': '₹420', 'icon': Icons.wallet_outlined},
    {'name': 'Freecharge', 'balance': '₹300', 'icon': Icons.flash_on_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Wallet Payment'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
              ),
              borderRadius: BorderRadius.circular(26),
            ),
            child: Column(
              children: [
                const Text(
                  'Amount To Pay',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.currency}${widget.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Choose Wallet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 14),

          ...wallets.map((wallet) {
            final isSelected = selectedWallet == wallet['name'];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  setState(() => selectedWallet = wallet['name'] as String);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E293B) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF2563EB)
                          : Colors.transparent,
                      width: 1.6,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(
                          alpha: isDark ? 0.18 : 0.06,
                        ),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: isSelected
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFEFF6FF),
                        child: Icon(
                          wallet['icon'] as IconData,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF2563EB),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              wallet['name'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Balance: ${wallet['balance']}',
                              style: TextStyle(
                                color: isDark ? Colors.white70 : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        isSelected
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: isSelected
                            ? const Color(0xFF2563EB)
                            : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF2563EB)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'This is a UI-only wallet payment screen. Connect your own payment gateway.',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
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
}
