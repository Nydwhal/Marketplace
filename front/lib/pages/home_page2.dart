import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/components/body.dart';
import 'package:shop_app/screens/home/components/popular_product.dart';
import 'package:shop_app/size_config.dart';

import '../components/coustom_bottom_nav_bar.dart';
import '../enums.dart';
import '../models/product.dart';
import '../screens/home/components/categories.dart';
import '../screens/home/components/discount_banner.dart';
import '../screens/home/components/home_header.dart';
import '../services/product_api.dart';
import '../utils/helper.dart';
import '../widgets/product_grid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedFilter = ProduitSort.id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orange Valley CAA'),
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton(
            onSelected: _onChangeFilter,
            icon: Icon(Icons.sort),
            offset: Offset(0, 100),
            itemBuilder: (context) => [
              PopupMenuItem(value: ProduitSort.id, child: Text('Par défaut')),
              PopupMenuItem(value: ProduitSort.label, child: Text('Par nom')),
              
            ],
          ),
        ],
      ),
      body: Container(
        
        child: FutureBuilder(
            future: getProductFromAPI(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else if (snapshot.hasError)
                return Center(child: Text(snapshot.error));
              else
                return ProductGrid(products: snapshot.data);
            }),
      ),
    );
  }

  void _onChangeFilter(ProduitSort choice) {
    if (choice != _selectedFilter) {
      setState(() {
        _selectedFilter = choice;
      });
    }
  }
}


// VideoSort ne permettra d'avoir 
// qu'une des 3 valeurs qu'il énumère
enum ProduitSort {
  id, label 
  // par ex. pour avoir le nom on fera VideoSort.label
}

// ajoute de nouvelle fonctionnalité à l'enum VideoSort
extension ParseEnumName on ProduitSort {
  String filterName() {
    // Si on a par ex. "VideoSort.duration" 
    // on ne retourne que la partie à droite du point
    return this.toString().split('.').last;
  }
}