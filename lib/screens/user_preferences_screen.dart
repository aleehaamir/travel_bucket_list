import 'package:flutter/material.dart';

class UserPreferencesScreen extends StatefulWidget {
  const UserPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<UserPreferencesScreen> createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  bool notificationsEnabled = false;
  List<String> favoriteDestinations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Preferences',
          style: TextStyle(color: Colors.white), // AppBar text color
        ),
        backgroundColor: Colors.teal, // Themed AppBar color
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Container(
        color: Colors.white, // Screen background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Enable Notifications Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Enable Notifications',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Switch(
                      value: notificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          notificationsEnabled = value;
                        });
                      },
                      activeColor: Colors.teal,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Favorite Destinations Section
            const Text(
              'Favorite Destinations:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: ['Paris', 'Tokyo', 'Maldives', 'New York', 'London']
                  .map((destination) {
                final isSelected = favoriteDestinations.contains(destination);
                return ChoiceChip(
                  label: Text(
                    destination,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: Colors.teal,
                  backgroundColor: Colors.grey.shade200,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        favoriteDestinations.add(destination);
                      } else {
                        favoriteDestinations.remove(destination);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Save Preferences Button
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Preferences Saved: Notifications - ${notificationsEnabled ? "Enabled" : "Disabled"}, '
                        'Favorites - ${favoriteDestinations.join(", ")}',
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Save Preferences',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
