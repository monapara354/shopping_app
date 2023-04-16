import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/widget/cart_item.dart';

import '../providers/chart.dart';
import '../providers/order.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Chart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //  margin: EdgeInsets.all(12),
            padding: const EdgeInsets.all(10.0),
            child: Card(
              // margin: EdgeInsets.all(10),
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      'Rs: ' + cart.total.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: (() {
                        Provider.of<Order>(context, listen: false)
                            .addOrder(cart.cItem.values.toList(), cart.total);
                        cart.clear();
                      }),
                      child: Text(
                        'order now',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return CartItem(
                    cart.cItem.values.toList()[index].id,
                    cart.cItem.keys.toList()[index],
                    cart.cItem.values.toList()[index].title,
                    cart.cItem.values.toList()[index].price,
                    cart.cItem.values.toList()[index].qunitiy);
              }),
              itemCount: cart.itemCount,
            ),
          )
        ],
      ),
    );
  }
}
