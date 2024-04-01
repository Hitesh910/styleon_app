import 'package:flutter/material.dart';
import 'package:styleon_app/screen/Cart/cart_screen.dart';
import 'package:styleon_app/screen/Home/home_screen.dart';
import 'package:styleon_app/screen/Product/product_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        'product':(context) => ProductScreen(),
        'cart':(context) => CartScreen(),
      },
    ),
  );
}
