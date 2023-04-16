import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products_pro.dart';
import '../providers/chart.dart';

class ProductItem extends StatelessWidget {
  // String? id;
  // String? title;
  // String? imageUrl;

  // ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final chartData = Provider.of<Chart>(context);
    return Container(
      margin: EdgeInsets.all(12),
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: product.id);
            },
            child: Image.network(
              product.imageUrl.toString(),
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.redAccent,
              ),
              onPressed: () {
                product.toggleFav();
              },
            ),
            title: Text(product.title.toString()),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                chartData.addItem(product.id.toString(),
                    product.title.toString(), product.price!.toDouble());
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Add item in cart!'),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        chartData.removeOne(product.id.toString());
                        print('hi');
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
