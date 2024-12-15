import 'package:flutter/material.dart';
import 'package:travel_bucket_list/HiveHelper/hive_helper_sevices.dart';
import 'package:travel_bucket_list/models/city_model.dart';
import 'package:travel_bucket_list/models/user_model.dart';

mixin BucketService {
  void addToBucket(BuildContext context, CityModel order) async {
    List getUser = await HiveService().getBoxes(HiveService().currentUser);
    UserModel user = getUser.first;
    if (!(await HiveService().isExists(boxName: HiveService().allBuckets))) {
      await HiveService().addBoxAndDelete([
        BucketModel(name: user.name, email: user.email, trips: [order])
      ], HiveService().allBuckets);
    }
    List<dynamic> getAllBuckets =
        await HiveService().getBoxes(HiveService().allBuckets);
    List<dynamic> allBuckets = getAllBuckets.first;
    if (allBuckets.any((element) => element.name == user.name)) {
      int index = allBuckets.indexWhere((element) => element.name == user.name);
      allBuckets[index].trips.add(order);
      await HiveService().addBoxAndDelete(allBuckets, HiveService().allBuckets);
    } else {
      allBuckets
          .add(BucketModel(name: user.name, email: user.email, trips: [order]));
      await HiveService().addBoxAndDelete(allBuckets, HiveService().allBuckets);
    }
  }

  Future<List<CityModel>> getBucketService(BuildContext context) async {
    List<CityModel> result = [];
    List getUser = await HiveService().getBoxes(HiveService().currentUser);
    UserModel user = getUser.first;
    if (!(await HiveService().isExists(boxName: HiveService().allBuckets))) {
      return result;
    }
    List<dynamic> getAllBuckets =
        await HiveService().getBoxes(HiveService().allBuckets);
    List<dynamic> allBuckets = getAllBuckets.first;
    if (allBuckets.any((element) => element.name == user.name)) {
      int index = allBuckets.indexWhere((element) => element.name == user.name);
      result = allBuckets[index].trips;
      return result;
    } else {
      return result;
    }
  }
}
