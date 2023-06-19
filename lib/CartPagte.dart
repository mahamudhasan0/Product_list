import 'package:flutter/material.dart';
import 'main.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;
  const CartPage({super.key, required this.products});

  int getQuantity(){
    int totalQuantity=0;
    for(var product in products){
      totalQuantity += product.quantity;
    }
    return totalQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: ${getQuantity()}'),
      ),
    );
  }
}
