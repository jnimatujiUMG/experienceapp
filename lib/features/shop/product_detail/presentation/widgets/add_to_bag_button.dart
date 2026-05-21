import 'package:flutter/material.dart';

class AddToBagButton extends StatelessWidget {

  const AddToBagButton({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add to bag'),
      ),
    );
  }
}