# 💳 Flutter Payment Screen

A modern and customizable payment UI package for Flutter.

Build beautiful checkout experiences with ready-to-use payment screens including UPI, Credit & Debit Cards, Wallets, Cash on Delivery, Payment Success, and Payment Failure screens.

Perfect for e-commerce, booking, subscription, and service-based Flutter applications.

---

## ✨ Features

- 💳 Modern Payment Screen
- 📱 UPI Payment Screen
- 💳 Credit & Debit Card Screen
- 👛 Wallet Payment Screen
- 📦 Cash On Delivery Screen
- ✅ Payment Success Screen
- ❌ Payment Failed Screen
- 🎨 Beautiful Blue-Purple Theme
- ⚡ Clean & Developer-Friendly API
- 🔧 Easy Customization
- 📱 Responsive UI

---

## 🎬 Preview

<p>
  <img src="example/assets/MP4/video.gif" width="280"/>
</p>

---

## 📦 Installation

Add the dependency:

```yaml
dependencies:
  flutter_payment_screen: ^0.0.1
```

Install packages:

```bash
flutter pub get
```

---

## 🚀 Quick Start

```dart
FlutterPaymentScreen(
  amount: 499,
  currency: "₹",
  onPay: () {
    print("Payment Started");
  },
)
```

---

## 💳 Available Payment Screens

### 📱 UPI Payment

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => UpiPaymentScreen(
      amount: 499,
    ),
  ),
);
```

### 💳 Card Payment

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => CardPaymentScreen(
      amount: 499,
    ),
  ),
);
```

### 👛 Wallet Payment

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => WalletPaymentScreen(
      amount: 499,
    ),
  ),
);
```

### 📦 Cash On Delivery

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => CashOnDeliveryScreen(
      amount: 499,
    ),
  ),
);
```

---

## ✅ Payment Success Screen

```dart
const PaymentSuccessScreen()
```

---

## ❌ Payment Failed Screen

```dart
const PaymentFailedScreen()
```

---

## 🎯 Included Widgets

- FlutterPaymentScreen
- UpiPaymentScreen
- CardPaymentScreen
- WalletPaymentScreen
- CashOnDeliveryScreen
- PaymentSuccessScreen
- PaymentFailedScreen
- PaymentMethodTile

---

## 🌟 Why Flutter Payment Screen?

Most payment UI implementations require developers to build multiple screens from scratch.

Flutter Payment Screen provides:

- Complete checkout flow UI
- Consistent design language
- Modern user experience
- Easy integration
- Production-ready structure

---

## 🛣 Roadmap

### Version 0.0.2

- Coupon Support
- Order Summary Widget
- Card Type Detection
- Enhanced UPI Experience
- More Customization Options

### Version 0.0.3

- Payment Animations
- Premium Themes
- Glassmorphism Support
- Additional Payment Methods

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome.

---

## ⭐ Support

If you like this package, please consider starring the repository and sharing it with the Flutter community.

Built with ❤️ for Flutter Developers.

# GitHub Link
https://github.com/Sakshi-2508/flutter_payment_screen <br>

# Package Preview Link
https://pub.dev/packages/flutter_payment_screen
