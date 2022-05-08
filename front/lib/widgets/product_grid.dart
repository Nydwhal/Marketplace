import 'package:flutter/material.dart';

import '../models/product.dart';


class ProductGrid extends StatelessWidget {
  final List<Produit> products;

  ProductGrid({this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      // children: [
      //   for (var product in products)
      //     GestureDetector(
      //       onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => DetailsPage(product: product))),
      //       child: _ProduitTille(
      //         image: product.image,
      //         title: product.label,
      //       ),
      //     )
      // ],
    );
  }
}

//---------------------------------------------------------------------
//------------Widget représentant un élément de la GridView------------
//---------------------------------------------------------------------
class _ProduitTille extends StatelessWidget {
  _ProduitTille({this.image, this.title});
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // mettre de l'espace autour de chaque élément de la GridView
      padding: EdgeInsets.all(10.0),
      child: Stack(children: [
        //----------Image----------
        Hero(
          tag: image,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              // Pour avoir des rebords arrondis dans le container
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
        ),
        //----------Titre----------
        Align(
          // pour positionner, en bas au centre, dans la Stack
          alignment: Alignment.bottomCenter,
          child: Container(
            // on baisse l'opacité pour avoir un effet semi-transparent
            color: Colors.black.withOpacity(0.6),
            height: 35,
            child: Center(
              child: Text(
                title, // passé en paramètre du constructeur
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
