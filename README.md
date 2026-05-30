# 💳 Flutter Payment Screen

A beautiful and customizable payment UI package for Flutter.

Build modern checkout experiences in minutes with ready-to-use payment screens, payment methods, order summaries, coupon fields, secure payment banners, and payment status screens.

---

## ✨ Features

* 💳 Beautiful Payment Screen
* 📱 UPI Payment Screen
* 🧾 Order Summary Card
* 🎟 Coupon Field
* 🔒 Secure Payment Banner
* ✅ Payment Success Screen
* ❌ Payment Failed Screen
* 🌙 Dark Mode Support
* 🎨 Fully Customizable
* ⚡ Clean & Simple API

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_payment_screen: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Usage

### Basic Payment Screen

```dart
FlutterPaymentScreen(
  amount: 499,
  currency: "₹",
  onPay: () {
    print("Payment Clicked");
  },
)
```

---

### Order Summary Card

```dart
OrderSummaryCard(
  subtotal: 499,
  discount: 50,
  deliveryFee: 20,
  tax: 10,
)
```

---

### Coupon Field

```dart
CouponField(
  onApply: () {
    print("Coupon Applied");
  },
)
```

---

### Secure Payment Banner

```dart
const SecurePaymentBanner()
```

---

### UPI Payment Screen

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const UpiPaymentScreen(
      amount: 499,
    ),
  ),
);
```

---

### Payment Success Screen

```dart
const PaymentSuccessScreen()
```

---

### Payment Failed Screen

```dart
const PaymentFailedScreen()
```

---

## 🎯 Included Widgets

* FlutterPaymentScreen
* UpiPaymentScreen
* OrderSummaryCard
* CouponField
* SecurePaymentBanner
* PaymentSuccessScreen
* PaymentFailedScreen
* PaymentMethodTile

---

## 📸 Preview

Add screenshots and demo GIFs here.

```md
assets/screenshots/payment_screen.png
assets/screenshots/upi_screen.png
```

---

## 🛣 Roadmap

### Version 0.0.2

* Google Pay UI
* PhonePe UI
* Paytm UI
* Beautiful UPI App Cards
* Card Payment Screen
* Wallet Payment Screen
* Cash On Delivery Screen

### Version 0.0.3

* Glassmorphism Support
* Payment Animations
* Premium Themes
* More Customization

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome.

---

## ⭐ Support

If you like this package, please give it a star on GitHub and share it with the Flutter community.

Built with ❤️ for Flutter Developers.
