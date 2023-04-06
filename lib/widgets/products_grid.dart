import 'package:flutter/material.dart';
import 'package:my_shop/providers/products.dart';

import 'package:provider/provider.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  var showFav;

  ProductsGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final loadedProducts = showFav ? productData.OnlyFav : productData.items;
    return GridView.builder(
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (ctx) => loadedProducts[i],
        child: ProductItem(
            // loadedProducts[i].id, loadedProducts[i].title,
            //   loadedProducts[i].imageUrl
            ),
      ),
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
