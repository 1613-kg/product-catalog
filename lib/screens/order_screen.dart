import 'package:flutter/material.dart';
import 'package:my_shop/widgets/app_drawer.dart';

import 'package:provider/provider.dart';
import '../providers/order.dart' show Order;
import '../widgets/order_item.dart';

class Orders extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}
