class Product {
  final String title;
  final String imageUrl;
  final double price;

  Product({
    required this.title,
    required this.imageUrl,
    required this.price,
  });
}

List<Product> foodShopItems() {
  return [
    Product(
      title: "Bananas",
      imageUrl: "images/bananas.png",
      price: 2.5,
    ),
    Product(
      title: "Blueberries",
      imageUrl: "images/blueberry.png",
      price: 3.0,
    ),
    Product(
      title: "Mango",
      imageUrl: "images/mango.png",
      price: 1.5,
    ),
    Product(
      title: "Strawberries",
      imageUrl: "images/strawberry.png",
      price: 4.0,
    ),
    Product(
      title: "Pineapple",
      imageUrl: "images/pineapple.png",
      price: 3.5,
    ),
  ];
}
