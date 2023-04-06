import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/order.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/Cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text("${prod.getTotal()}"),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Order>(context, listen: false).addOrder(
                        prod.items.values.toList(),
                        prod.getTotal(),
                      );
                      prod.clear();
                    },
                    child: Text("Order Now"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItem(
                prod.items.values.toList()[i].id,
                prod.items.keys.toList()[i],
                prod.items.values.toList()[i].price,
                prod.items.values.toList()[i].quantity,
                prod.items.values.toList()[i].title,
              ),
              itemCount: prod.itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
