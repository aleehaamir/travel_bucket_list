import 'package:flutter/material.dart';

class EditPreferencesScreen extends StatelessWidget {
  const EditPreferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Preferences'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              value: true,
              onChanged: (bool value) {
                // Handle notifications toggle
              },
              title: const Text('Receive Notifications'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Theme',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              value: 'Light',
              groupValue: 'Theme',
              onChanged: (value) {
                // Handle theme change
              },
              title: const Text('Light Theme'),
            ),
            RadioListTile(
              value: 'Dark',
              groupValue: 'Theme',
              onChanged: (value) {
                // Handle theme change
              },
              title: const Text('Dark Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
