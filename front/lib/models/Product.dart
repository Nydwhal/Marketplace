// To parse this JSON data, do
//
//     final Produit = videoFromJson(jsonString);

import 'dart:convert';

// List<Produit> productFromJson(String str) => List<Produit>.from(json.decode(str).map((x) => Produit.fromJson(x)));

// String productToJson(List<Produit> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produit {

    final int id;
    final String label;
    final String description;
    final double initialPrice;
    final double currentPrice;
    final DateTime startDate;
    final DateTime endDate;
    final String state;
    final String image;

    Produit({
        this.id,
        this.label,
        this.description,
        this.initialPrice,
        this.currentPrice,
        this.startDate,
        this.endDate,
        this.state,
        this.image,
    });
    
    

    static Produit fromJson(Map<String, dynamic> json) => Produit(
        id: json["id"],
        label: json["label"],
        description: json["description"],
        initialPrice: json["initial_price"].toDouble(),
        currentPrice: json["current_price"].toDouble(),
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        state: json["state"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "description": description,
        "initialPrice": initialPrice,
        "currentPrice": currentPrice,
        "startDate": startDate,
        "endDate": endDate,
        "state": state,
        "image": image,
    };
}
