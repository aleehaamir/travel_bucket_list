class Hotel {
  final String name;
  final String address;
  final String imageUrl;
  final int price;

  Hotel({
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.price,
  });
}

// Global function to get the list of hotels
List<Hotel> getHotels() {
  return [
    Hotel(
      name: 'Hotel Venezia',
      address: '404 Canal St, Venice',
      imageUrl: 'assets/images/hotel0.jpg',
      price: 250,
    ),
    Hotel(
      name: 'Eiffel Suites',
      address: '12 Champs Elysees, Paris',
      imageUrl: 'assets/images/hotel1.jpg',
      price: 300,
    ),
    Hotel(
      name: 'Tokyo Stay',
      address: '7 Shibuya Crossing, Tokyo',
      imageUrl: 'assets/images/hotel2.jpg',
      price: 200,
    ),
    Hotel(
      name: 'Pyramid Inn',
      address: '15 Giza Rd, Cairo',
      imageUrl: 'assets/images/hotel3.jpg',
      price: 150,
    ),
  ];
}
