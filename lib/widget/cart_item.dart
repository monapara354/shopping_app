import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String proId;
  final String title;
  final double price;
  final int qunitiy;

  CartItem(this.id, this.proId, this.title, this.price, this.qunitiy);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 35,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to remove'),
                actions: [
                  TextButton(
                      onPressed: (() {
                        Navigator.of(context).pop(false);
                      }),
                      child: Text('No')),
                  TextButton(
                      onPressed: (() {
                        Navigator.of(context).pop(true);
                      }),
                      child: Text('Yes')),
                ],
              ))),
      onDismissed: (direction) {
        Provider.of<Chart>(context, listen: false).removeItem(proId);
//
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        elevation: 4,
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
                child: Text(
              (price * qunitiy).toString(),
              style: TextStyle(fontSize: 12),
            )),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            'RS:' + price.toString(),
            style: TextStyle(fontSize: 15),
          ),
          trailing: Text(
            'Qu :' + qunitiy.toString(),
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
