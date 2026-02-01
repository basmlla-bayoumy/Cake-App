import 'package:cake_app/models/cake.dart';
import 'package:cake_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class IconsButtonWidget extends StatelessWidget {
  const IconsButtonWidget({
    super.key,
    required this.cake,
    required this.cart,
  });

  final Cake cake;
  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            cake.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "${cake.price} EGP",
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  cart.decreaseQuantity(cake.id);
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                ),
              ),
    
              Text(
                "${cake.quantity}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
    
              IconButton(
                onPressed: () {
                  cart.increaseQuantity(cake.id);
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}