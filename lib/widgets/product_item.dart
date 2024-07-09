// lib/widgets/product_item.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu_app/models/product.dart';
import 'package:timbu_app/providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    const String imgUrl='http://api.timbu.cloud/images/';

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          '$imgUrl${product.photos[0].url}',
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        
        ),
        title: Text(product.name),
        subtitle: Text(product.description),
        trailing: Text('\$${product.price.toStringAsFixed(2)}'),
        onTap: () {
          cartProvider.addProduct(product);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to cart')),
          );
        },
      ),
    );
  }
}
