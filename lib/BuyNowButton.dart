import 'package:flutter/material.dart';

class buyNowButton extends StatefulWidget {
  final ValueChanged<int> counterUpdate;

  const buyNowButton({super.key, required this.counterUpdate});

  @override
  State<buyNowButton> createState() => _buyNowButtonState();
}

class _buyNowButtonState extends State<buyNowButton> {
  int counter = 0;

  void buyProduct() {
    setState(() {
      counter++;
      widget.counterUpdate(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Counter: $counter'),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(onPressed: buyProduct, child: const Text('Buy Now'))
        ],
      ),
    );
  }
}