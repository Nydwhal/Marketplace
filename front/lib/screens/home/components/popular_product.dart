import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/network_utils/api.dart';

import '../../../models/Product1.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
    Future<List<Product>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = Network().fetchProduct();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
  future: futureProduct,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      var products = snapshot.data;
       return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Produits populaires", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                (index) {
                  return Center();
                    // return ProductCard(product: products[index]);
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }

    // By default, show a loading spinner.
    return const CircularProgressIndicator();
  },
);
   
  }
}
