import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String value;

  Badge(this.value);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: (() {
            Navigator.pushNamed(context, '/cart');
          }),
          icon: Icon(Icons.shopping_cart),
        ),
        Positioned(
            top: 8,
            right: 8,
            child: Container(
              constraints: BoxConstraints(
                minHeight: 17,
                minWidth: 17,
              ),

              child: Text(
                value,
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
              //  color: Colors.redAccent,
            ))
      ],
    );
  }
}
