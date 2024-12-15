import 'package:hive/hive.dart';

part 'city_model.g.dart';

@HiveType(typeId: 2)
class BucketModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  List<CityModel> trips;
  BucketModel({
    required this.name,
    required this.email,
    required this.trips,
  });
}

@HiveType(typeId: 3)
class CityModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  @HiveField(2)
  double amount;
  @HiveField(3)
  List<Hotel> hotels;
  CityModel(
      {required this.name,
      required this.image,
      this.amount = 0,
      required this.hotels});
}

@HiveType(typeId: 4)
class Hotel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String address;
  @HiveField(2)
  String imageUrl;
  @HiveField(3)
  int days;
  @HiveField(4)
  double price;
  @HiveField(5)
  bool isSelected;
  @HiveField(6)
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
