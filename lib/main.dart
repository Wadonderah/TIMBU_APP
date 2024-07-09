// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu_app/providers/product_provider.dart';
import 'package:timbu_app/screens/product_list_screen.dart';

void main() {
  runApp(const TimbuApp());
}

class TimbuApp extends StatelessWidget {
  const TimbuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Timbu App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductListScreen(),
      ),
    );
  }
}

