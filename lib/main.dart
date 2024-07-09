// lib/main.dart

// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu_app/screens/home_screen.dart';
import 'package:timbu_app/providers/product_provider.dart';
import 'package:timbu_app/providers/cart_provider.dart';

void main() {
  runApp(const TimbuShoppingApp());
}

class TimbuShoppingApp extends StatelessWidget {
  const TimbuShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()..fetchProducts()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Timbu Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

