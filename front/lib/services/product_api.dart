
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

 final String baseUrl = 'http://192.168.56.1:8000/api';

Future<List<Produit>>getProductFromAPI() async{
  final response = await http.get(Uri.parse('$baseUrl/product/products'));
    debugPrint("${response.body}");
    
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // final List<Produit> _products = [];
    // var json = jsonDecode(response.body);
    List json = jsonDecode(response.body) ;
     return json.map((product) => Produit.fromJson(product)).toList();

    // if (json != null) {
    //   json.forEach((product) {
    //     _products.add(product);
    //   });
    // }
    // return _products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
