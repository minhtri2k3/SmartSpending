class SMRestaurant {
  final String name;
  final String address;
  final String? image;
  final int? rate;
  final String? note;
  final String? favor;
  final String? previousTime;

  SMRestaurant({
    required this.name,
    required this.address,
    this.image,
    this.rate,
    this.note,
    this.favor,
    this.previousTime,
  });
}

List<SMRestaurant> restaurants = [
  SMRestaurant(
    name: "The Gourmet Kitchen",
    address: "123 Main Street, Springfield",
    image: "images/restaurants/test.png",
    rate: 5,
    note: "Great ambiance and delicious food!",
    favor: "Bánh canh",
    previousTime: "Yesterday, 8:00 PM",
  ),
  SMRestaurant(
    name: "Pizza Paradise",
    address: "456 Elm Street, Shelbyville",
    image: "images/restaurants/test.png",
    rate: 4,
    note: "Best pizza in town!",
    favor: "Bún bò huế",
    previousTime: "Last Week, 7:30 PM",
  ),
  SMRestaurant(
    name: "Sushi World",
    address: "789 Oak Avenue, Capital City",
    image: "images/restaurants/test.png",
    rate: 5,
    note: "Fresh sushi and quick service.",
    favor: "Bánh xèo",
    previousTime: "2 Days Ago, 6:45 PM",
  ),
  SMRestaurant(
    name: "Burger Haven",
    address: "321 Maple Road, Springfield",
    image: "images/restaurants/test.png",
    rate: 3,
    note: "Affordable and decent burgers.",
    favor: "Bánh đa cua",
    previousTime: "Last Month, 5:00 PM",
  ),
  SMRestaurant(
    name: "Curry Express",
    address: "654 Pine Lane, Shelbyville",
    image: "images/restaurants/test.png",
    rate: 4,
    note: "Spicy curries with authentic flavors.",
    previousTime: "Last Night, 7:00 PM",
  ),
];
