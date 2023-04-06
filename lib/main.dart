import 'package:flutter/material.dart';
import 'package:my_shop/screens/cart_screen.dart';
import 'package:my_shop/screens/edit_product_screen.dart';
import 'package:my_shop/screens/user_product_screen.dart';

import 'screens/product_overview.dart';
import '/screens/product_details.dart';
import 'providers/products.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:provider/provider.dart';
import 'providers/order.dart';
import 'screens/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Order(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.pink,
          fontFamily: 'Lato',
        ),
        home: ProductOverview(),
        routes: {
          ProductDetails.routeName: (ctx) => ProductDetails(),
          CartScreen.routeName: (ctx) => CartScreen(),
          Orders.routeName: (ctx) => Orders(),
          UserProduct.routeName: (ctx) => UserProduct(),
          EditProduct.routeName: (ctx) => EditProduct(),
        },
      ),
    );
  }
}
