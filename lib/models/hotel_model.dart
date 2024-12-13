class City {
  String name;
  String image;
  List<Hotel> hotels;
  City({
    required this.name,
    required this.image,
    required this.hotels,
  });
}

class Hotel {
  String name;
  String address;
  String imageUrl;
  int days;
  double price;
  bool isSelected;
  String date;

  Hotel({
    required this.name,
    required this.address,
    required this.imageUrl,
    this.days = 0,
    this.date = '',
    required this.price,
    this.isSelected = false,
  });
}
