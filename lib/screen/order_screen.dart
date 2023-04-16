import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/order.dart';
import 'package:shopping_app/widget/app_drawer.dart';
import 'package:shopping_app/widget/order_item.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemBuilder: ((context, index) => OrderItems(orderData.order[index])),
        itemCount: orderData.order.length,
      ),
    );
  }
}
