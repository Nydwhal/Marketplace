import 'package:flutter/material.dart';

import 'ProductModel.dart';

class Cart {
  final ProductModel product;
  final int numOfItem;

  Cart({@required this.product, @required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProductModels[0], numOfItem: 2),
  Cart(product: demoProductModels[1], numOfItem: 1),
  Cart(product: demoProductModels[3], numOfItem: 1),
];
