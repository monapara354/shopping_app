import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product.dart';

class ProductPro with ChangeNotifier {
  // not final but private and changeable
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 1000,
      imageUrl:
          'https://1.bp.blogspot.com/-YSAgWpOn1IA/U6FVuFCCGzI/AAAAAAAAA4g/ftSTdvtJS_Q/s1600/71KAJ6D8DyL._UL1500_.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 2000,
      imageUrl:
          'https://th.bing.com/th/id/OIP.fyRnCGX91VmBqff5sG--7gHaHa?pid=ImgDet&rs=1',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 500,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 4000,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
        id: 'p5',
        title: 'Black T- shirt',
        description:
            'Get maximum comfort with the Emporio Armani Short Sleeved T-Shirt in Black.',
        price: 2000,
        imageUrl:
            'https://www.80scasualclassics.co.uk/images/emporio-armani-organic-cotton-t-shirt-black-p15580-86408_image.jpg'),
    Product(
        id: 'p6',
        title: 'Men shirt',
        description: 'Men Regular Fit Polka Print Spread Collar Casual Shirt',
        price: 3000,
        imageUrl:
            'https://www.hirawatsonline.com/wp-content/uploads/2020/10/Shirts-2-1.jpg'),
  ];

  List<Product> get items {
    //  its copy of _items becaues poniter in memory
    return [..._items];
  }

  List<Product> get favorite {
    return _items.where((element) => element.isFavorite).toList();
  }

//
  void addProduct() {
    // this use when update data in screen
    // method is context.read<>() screen file
    notifyListeners(); // this is listener
  }
}
