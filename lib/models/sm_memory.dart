class SMMemory {
  String name;
  String date;
  String description;
  List<String> images;

  SMMemory({
    required this.name,
    required this.date,
    required this.description,
    required this.images,
  });
}

List<SMMemory> memories = [
  SMMemory(
    name: "Đánh giấu cột mốc yêu",
    date: "21/04/2024",
    description: "Ngày tôi yêu em",
    images: [
      "images/restaurants/test.png",
      "images/restaurants/test.png",
      "images/restaurants/test.png",
      "images/restaurants/test.png"
    ],
  ),
  SMMemory(
    name: "Đánh giấu cột mốc yêu",
    date: "21/04/2024",
    description: "Ngày tôi yêu em",
    images: [
      "images/restaurants/test.png",
      "images/restaurants/test.png",
      "images/restaurants/test.png",
      "images/restaurants/test.png"
    ],
  ),
  SMMemory(
    name: "Đánh giấu cột mốc yêu",
    date: "21/04/2024",
    description: "Ngày tôi yêu em",
    images: [
      "images/restaurants/test.png",
      "images/restaurants/test.png",
      "images/restaurants/test.png"
    ],
  ),
  SMMemory(
    name: "Đánh giấu cột mốc yêu",
    date: "21/04/2024",
    description: "Ngày tôi yêu em",
    images: ["images/restaurants/test.png"],
  ),
];
