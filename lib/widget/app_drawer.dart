import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColorDark,
            width: double.infinity,
            height: 200,
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 35),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.shop,
              size: 25,
            ),
            title: Text(
              'Shop',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment_sharp,
              size: 25,
            ),
            title: Text(
              'Order',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.pushReplacementNamed(context, '/order'),
          )
        ],
      ),
    );
  }
}
