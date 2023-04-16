import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/chart.dart';
import './providers/order.dart';
import './screen/cart_screen.dart';
import './screen/order_screen.dart';
import './providers/products_pro.dart';
import './screen/product_details.dart';
import './screen/product_screen.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductPro(),
        ),
        ChangeNotifierProvider(
          create: ((context) => Chart()),
        ),
        ChangeNotifierProvider(
          create: ((context) => Order()),
        )
      ], // define (listener) of our provider File instanse
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
            primarySwatch: Colors.teal,
            accentColor: Colors.deepOrangeAccent,
            fontFamily: 'Lato'),
        home: ProductScreen(),
        routes: {
          '/details': (context) => ProductDetails(),
          '/cart': (context) => CartScreen(),
          '/order': (context) => OrderScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
