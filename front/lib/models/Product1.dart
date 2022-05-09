

class Product {
  final int id;
  final String label;
  final String description;
  final int initialPrice;
  final int currentPrice;
  final DateTime startDate;
  final DateTime endDate;
  final String state;
  final String image;
  
  const Product({
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: int.parse(json["id"]),
        label: json["label"],
        description: json["description"],
        initialPrice: int.parse(json["initial_price"]),
        currentPrice: int.parse(json["current_price"]),
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        state: json["state"],
        image: json["image"],
    );
  }
}