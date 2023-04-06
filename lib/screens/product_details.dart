import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/Product_details';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProducts = Provider.of<Products>(context).findById(id);
    return Scaffold(appBar: AppBar(title: Text(loadedProducts.title)));
  }
}
