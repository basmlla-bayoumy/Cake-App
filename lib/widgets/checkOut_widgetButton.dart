import 'package:cake_app/providers/cart_provider.dart';
import 'package:cake_app/screens/checkout_screen.dart';
import 'package:flutter/material.dart';

class CheckoutWidgetbutton extends StatelessWidget {
  const CheckoutWidgetbutton({
    super.key,
    required this.cart,
  });

  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: cart.items.isEmpty
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckoutScreen(),
                ),
              );
              cart.clearData();
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF6A7A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        "Checkout",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
