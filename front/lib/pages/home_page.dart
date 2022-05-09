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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Produit>> futureProduct;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureProduct = getProductFromAPI();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('MARKETPLACE'),
        backgroundColor: Colors.black,
      ),          
        
      body: Container(  
        child: FutureBuilder<List<Produit>>(
            future:futureProduct,
            builder: (context, snapshot) {
            if (snapshot.hasError) {
                return Center(child: Text("Erreur ! ${snapshot.error}"));
              } else if (snapshot.hasData) {
                final products = snapshot.data;
                return ListView( children: products.map(buildProduct).toList());
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 243, 180, 33),
                ));
              }
        }),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  Widget buildProduct(Produit product) {

    return Card(
      elevation: 10,
      child: ListTile(
        leading: Container(
          height: 400,
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage("assets/images/${product.image}"), fit: BoxFit.cover),
            // image: DecorationImage(image: MemoryImage(base64Decode("${product.image}")), fit: BoxFit.cover)
          ),
        ),
        title: Text("${product.label}"),
        subtitle: Text("${product.description}"),
      ),
    );
  }
  
}




