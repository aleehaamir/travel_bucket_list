// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:travel_bucket_list/HiveHelper/hive_helper_sevices.dart';
import 'package:travel_bucket_list/models/user_model.dart';

mixin ProfileService {
  Future<bool> changePassword({
    required BuildContext context,
    required String oldPass,
    required String newPass,
  }) async {
    bool result = false;

    List getUser = await HiveService().getBoxes(HiveService().currentUser);
    UserModel user = getUser.first;
    if (user.password == oldPass) {
      user.password = newPass;
      await HiveService().addBoxAndDelete(user, HiveService().currentUser);
      List<dynamic> getUsers =
          await HiveService().getBoxes(HiveService().usersList);
      List<dynamic> users = getUsers.first;
      int index = users.indexWhere((element) =>
          element.name == user.name && element.email == user.email);
      users[index].password = newPass;

      await HiveService().addBoxAndDelete(users, HiveService().usersList);
      result = true;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password updated successfully")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please put correct current password")));
    }
    return result;
  }
}
