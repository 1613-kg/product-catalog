import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/Product_details';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(appBar: AppBar(title: Text('title')));
  }
}
