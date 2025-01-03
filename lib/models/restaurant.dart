class SMRestaurant {
  final String name;
  final String address;
  final String? image;
  final int? rate;
  final String? note;
  final String? previousTime;

  SMRestaurant(
      {required this.name,
      required this.address,
      this.image,
      this.rate,
      this.note,
      this.previousTime});
}
