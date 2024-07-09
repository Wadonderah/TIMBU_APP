
import 'package:flutter/material.dart';
import 'package:timbu_app/models/product.dart';
import 'package:timbu_app/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _loading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  bool get loading => _loading;
  String? get errorMessage => _errorMessage;

  final ProductService _productService = ProductService();

  Future<void> fetchProducts() async {
    _loading = true;
    notifyListeners();

    try {
      _products = await _productService.fetchProducts();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
