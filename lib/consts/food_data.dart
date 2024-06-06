class Food {
  String imagepath;
  String detailImagePath;
  String name;
  String description;
  double price;
  int count;
  bool faved;
  String category;

  Food({
    required this.imagepath,
    required this.detailImagePath,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
    required this.faved,
    required this.category,
  });
}

List<Food> foodList = [
  Food(
    imagepath: "lib/assets/maskgroup_1.png",
    detailImagePath: "lib/assets/detailimage_1.png",
    name: "Veggie tomato mix",
    description: "description",
    price: 24.99,
    count: 1,
    faved: false,
    category: "Foods",
  ),
  Food(
    imagepath: "lib/assets/maskgroup_2.png",
    detailImagePath: "lib/assets/detailimage_2.png",
    name: "Rice and Veggies",
    description: "description",
    price: 44.99,
    count: 1,
    faved: false,
    category: "Foods",
  ),
  Food(
    imagepath: "lib/assets/maskgroup_3.png",
    detailImagePath: "lib/assets/detailimage_3.png",
    name: "Curly Pasta",
    description: "description",
    price: 50.99,
    count: 1,
    faved: false,
    category: "Foods",
  ),
  Food(
    imagepath: "lib/assets/maskgroup_4.png",
    detailImagePath: "lib/assets/detailimage_4.png",
    name: "Thai Set",
    description: "description",
    price: 76.99,
    count: 1,
    faved: false,
    category: "Foods",
  ),
  Food(
    imagepath: "lib/assets/123.png",
    detailImagePath: "lib/assets/123.png",
    name: "Coca Cola",
    description: "description",
    price: 1.99,
    count: 1,
    faved: false,
    category: "Drinks",
  ),
  Food(
    imagepath: "lib/assets/1234.webp",
    detailImagePath: "lib/assets/1234.webp",
    name: "Orange Juice",
    description: "description",
    price: 3.99,
    count: 1,
    faved: false,
    category: "Drinks",
  ),
  Food(
    imagepath: "lib/assets/12.webp",
    detailImagePath: "lib/assets/12.webp",
    name: "Chips",
    description: "description",
    price: 2.99,
    count: 1,
    faved: false,
    category: "Snacks",
  ),
  Food(
    imagepath: "lib/assets/nuts.png",
    detailImagePath: "lib/assets/nuts.png",
    name: "Nuts",
    description: "description",
    price: 4.99,
    count: 1,
    faved: false,
    category: "Snacks",
  ),
  Food(
    imagepath: "lib/assets/s.png",
    detailImagePath: "lib/assets/s.png",
    name: "Ketchup",
    description: "description",
    price: 0.99,
    count: 1,
    faved: false,
    category: "Sauces",
  ),
  Food(
    imagepath: "lib/assets/s1.png",
    detailImagePath: "lib/assets/s1.png",
    name: "Mayonnaise",
    description: "description",
    price: 1.49,
    count: 1,
    faved: false,
    category: "Sauces",
  ),
];
