import 'dart:math';

import 'package:flutter/material.dart';
import '../providers/order.dart' as ord;
import 'package:intl/intl.dart';

class OrderItems extends StatefulWidget {
  final ord.OrderItem orderItem;

  OrderItems(this.orderItem);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expand = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Rs:' + widget.orderItem.total.toString()),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                .format(widget.orderItem.dateTime)),
            trailing: IconButton(
              icon: Icon(_expand ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expand = !_expand;
                });
              },
            ),
          ),
          if (_expand)
            Container(
              height: min(widget.orderItem.cartProduct.length * 20.0 + 10, 180),
              child: ListView(
                children: widget.orderItem.cartProduct
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            prod.title.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                              prod.qunitiy.toString() +
                                  ' X ' +
                                  prod.price.toString(),
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
