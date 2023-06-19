import 'package:flutter/material.dart';
import 'BuyNowButton.dart';
import 'CartPagte.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class Product {
  final String name;
  final double price;
  int quantity;

  Product({required this.name, required this.price, this.quantity = 0});
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 100),
    Product(name: 'Product 2', price: 200),
    Product(name: 'Product 3', price: 300),
    Product(name: 'Product 4', price: 400),
    Product(name: 'Product 5', price: 500),
    Product(name: 'Product 6', price: 600),
    Product(name: 'Product 7', price: 700),
    Product(name: 'Product 8', price: 800),
    Product(name: 'Product 9', price: 900),
    Product(name: 'Product 10', price: 100),
    Product(name: 'Product 11', price: 200),
    Product(name: 'Product 12', price: 300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartPage(products: products)),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: buyNowButton(
              counterUpdate: (quantity) {
                products[index].quantity = quantity;
                if (quantity == 5) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Congratulate!'),
                            content: Text(
                                'You\'ve bought 5 ${products[index].name}'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'))
                            ],
                          ));
                }
              },
            ),
          );
        },
      ),
    );
  }
}


