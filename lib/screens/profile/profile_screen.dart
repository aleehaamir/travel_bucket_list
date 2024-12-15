import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_bucket_list/HiveHelper/hive_helper_sevices.dart';
import 'package:travel_bucket_list/models/user_model.dart';
import 'package:travel_bucket_list/screens/profile/change_password_screen.dart';
import 'package:travel_bucket_list/screens/profile/edit_preferences_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? profileImageUrl; // Null by default to show the default user icon

  void _changeProfilePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        profileImageUrl = pickedImage.path; // Update profile picture
      });
    }
  }

  UserModel user = UserModel(name: '', email: '', password: '');

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      getUser();
    });
  }

  void getUser() async {
    List users = await HiveService().getBoxes(HiveService().currentUser);
    user = users.first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Themed AppBar color
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Section
              Center(
                child: GestureDetector(
                  onTap: _changeProfilePicture,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: profileImageUrl == null
                        ? null
                        : FileImage(File(profileImageUrl!)) as ImageProvider?,
                    child: profileImageUrl == null
                        ? const Icon(Icons.person,
                            size: 60, color: Colors.white)
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  user.name, // Replace with user's name
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  user.email,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 40),
              // Edit Preferences Section
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.teal),
                title: const Text('Edit Preferences'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditPreferencesScreen()),
                  );
                },
              ),
              const Divider(),
              // Change Password Section
              ListTile(
                leading: const Icon(Icons.lock, color: Colors.teal),
                title: const Text('Change Password'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen()),
                  );
                },
              ),
              const Divider(),
              // Logout Section
              ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.red),
                title: const Text('Logout'),
                onTap: () async {
                  await HiveService().deleteBox(HiveService().currentUser);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/splash', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
