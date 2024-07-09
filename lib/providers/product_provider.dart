// lib/providers/product_provider.dart

import 'package:flutter/material.dart';

import 'package:timbu_app/services/product_service.dart';

import '/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _loading = false;
  String? _errorMessage;
  final ProductService _productService = ProductService();

  List<Product> get products => _products;
  bool get loading => _loading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _loading = true;
    notifyListeners();

    try {
      _products = await _productService.fetchProducts();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to load products: $e';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
