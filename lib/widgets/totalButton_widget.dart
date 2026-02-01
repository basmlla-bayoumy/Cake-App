import 'package:cake_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class TotalButtonWidget extends StatelessWidget {
  const TotalButtonWidget({
    super.key,
    required this.cart,
  });

  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Total",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          "${cart.total.toStringAsFixed(2)} EGP",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
