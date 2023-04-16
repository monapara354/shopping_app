import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screen/add_product.dart';
import '../widget/app_drawer.dart';
import '../widget/badge.dart';

import '../widget/product_grid.dart';
import '../providers/chart.dart';

enum Filter {
  Favorite,
  All,
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var showFav = false;

  @override
  Widget build(BuildContext context) {
    final _count = Provider.of<Chart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping'),
        actions: [
          PopupMenuButton(
            onSelected: (Filter value) {
              setState(() {
                if (value == Filter.Favorite) {
                  showFav = true;
                } else {
                  showFav = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Favorite Item'),
                value: Filter.Favorite,
              ),
              PopupMenuItem(
                child: Text('All Item'),
                value: Filter.All,
              ),
            ],
          ),
          Badge(
            _count.itemCount.toString(),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: ProductGrid(showFav),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: ((context) {
      //       return AddProduct();
      //     })));
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
