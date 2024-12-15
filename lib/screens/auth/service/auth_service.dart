// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:travel_bucket_list/HiveHelper/hive_helper_sevices.dart';
import 'package:travel_bucket_list/models/user_model.dart';
import 'package:travel_bucket_list/screens/home/home_screen.dart';

mixin AuthService {
  void registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    // List<UserModel> saveUsers = [
    //   UserModel(name: "usama", email: 'email', password: 'pass'),
    //   UserModel(name: "usama1", email: 'email1', password: 'pass1'),
    //   UserModel(name: "usama2", email: 'email2', password: 'pass2'),
    // ];
    // await HiveService().addBoxAndDelete(saveUsers, HiveService().usersList);
    // await HiveService().addBoxAndDelete(<UserModel>[], HiveService().usersList);
    List<dynamic> getUsers =
        await HiveService().getBoxes(HiveService().usersList);
    List<dynamic> users = getUsers.first;
    if (users.any((element) => element.name == name)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User name $name already exist")));
      return;
    } else if (users.any((element) => element.email == email)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User email $email already exist")));
      return;
    }
    users.add(UserModel(name: name, email: email, password: password));

    await HiveService().addBoxAndDelete(users, HiveService().usersList);

    await HiveService().addBoxAndDelete(
        UserModel(name: name, email: email, password: password),
        HiveService().currentUser);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void login({
    required BuildContext context,
    required String name,
    required String password,
  }) async {
    List<dynamic> getUsers =
        await HiveService().getBoxes(HiveService().usersList);
    List<dynamic> users = getUsers.first;
    if (users.any(
        (element) => element.name == name && element.password == password)) {
      int index = users.indexWhere(
          (element) => element.name == name && element.password == password);
      await HiveService().addBoxAndDelete(
          UserModel(
              name: users[index].name,
              email: users[index].email,
              password: users[index].password),
          HiveService().currentUser);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid username or password")));
      return;
    }
  }
}
