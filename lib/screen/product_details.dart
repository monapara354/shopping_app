import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shopping_app/models/product.dart';
import '../providers/products_pro.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final productItem = Provider.of<ProductPro>(context).items.firstWhere(
          (element) => element.id == id,
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(productItem.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  productItem.imageUrl.toString(),
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 15,
            ),
            Text(
              'Rs: ' + productItem.price.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              productItem.description.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
