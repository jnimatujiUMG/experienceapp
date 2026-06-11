import 'package:flutter/material.dart';

class CartQuantitySelector
    extends StatelessWidget {

  final VoidCallback onDecrease;

  final VoidCallback onIncrease;

  final int quantity;

  const CartQuantitySelector({
    super.key,
    required this.onDecrease,
    required this.onIncrease,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        _button(
          icon: Icons.remove,
          onTap: onDecrease,
        ),

        Padding(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),

        _button(
          icon: Icons.add,
          onTap: onIncrease,
        ),
      ],
    );
  }

  Widget _button({
    required IconData icon,
    required VoidCallback onTap,
  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(
        width: 32,
        height: 32,

        decoration: BoxDecoration(
          color: const Color(0xFFE9EEF8),
          borderRadius:
              BorderRadius.circular(20),
        ),

        child: Icon(
          icon,
          size: 18,
          color: Colors.blue,
        ),
      ),
    );
  }
}