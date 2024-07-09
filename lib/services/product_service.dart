
// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timbu_app/models/product.dart';

class ProductService {
  final String _baseUrl = 'https://api.timbu.cloud/products';
  final String _organizationId = 'e3e57fad19c34b048924d5791205a717';
  final String _appId = 'EK4C7W01A3J332Q';
  final String _apiKey = '3799f51d64e745bd923eb94e5cc0ed2820240706102406713387';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(
        '$_baseUrl?organization_id=$_organizationId&reverse_sort=false&page=1&size=25&Appid=$_appId&Apikey=$_apiKey',
      ),
    );

    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(data);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      print('Failed to load products');
      throw Exception('Failed to load products');
    }
  }
}

