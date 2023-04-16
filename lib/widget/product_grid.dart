import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_pro.dart';
import '../widget/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;
  ProductGrid(this.showFav);

//

  @override
  Widget build(BuildContext context) {
    // this <> is listener when main.dart define
    //  data = context.watch<ProductPro>().items;   get data by context.watch
    final productData = Provider.of<ProductPro>(context);
    final productItems = showFav ? productData.favorite : productData.items;
    return GridView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value:
            productItems[index], // (.value) should use in single grid and list
        // create: (ctx) => productItems[index],
        child: ProductItem(
            // id: productItems[index].id,
            // title: productItems[index].title,
            // imageUrl: productItems[index].imageUrl
            ),
      ),
      itemCount: productItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
    );
  }
}
