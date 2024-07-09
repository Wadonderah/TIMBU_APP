// lib/services/product_service.dart

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:timbu_app/models/product.dart';

class ProductService {
  final String _baseUrl = 'https://api.timbu.cloud';
  final String _organizationId = 'e3e57fad19c34b048924d5791205a717';
  final String _appId = 'EK4C7W01A3J332Q';
  final String _apiKey = '3799f51d64e745bd923eb94e5cc0ed2820240706102406713387';

  Future<List<Product>> fetchProducts() async {
    final String productsUrl = '$_baseUrl/products';

    try {
      final response = await http.get(
        Uri.parse(
          '$productsUrl?organization_id=$_organizationId&reverse_sort=false&page=1&size=25&Appid=$_appId&Apikey=$_apiKey',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = data['items'] ?? [];
        return items.map<Product>((item) => Product.fromJson(item, '$_baseUrl/images/andco/')).toList();
      } else {
        print('Failed to load products: ${response.statusCode}');
        throw Exception('Failed to load products');
      }
    } on SocketException catch (e) {
      print('Network error: $e');
      throw Exception('Network error: $e');
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Error fetching products: $e');
    }
  }
}

