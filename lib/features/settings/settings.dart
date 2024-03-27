import 'package:app_test/common/style/appbar_style.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.data_array, size: 28),
            title: Text('See my data'),
            onTap: () {},
          ),
          // Privacy Settings
          ListTile(
            leading: Icon(Icons.privacy_tip, size: 28),
            title: Text('Privacy Settings'),
            onTap: () {},
          ),
          // About us 
          ListTile(
            leading: Icon(Icons.info, size: 28),
            title: Text('About us'),
            onTap: () {},
          ),
          // My Weekly Activity
          ListTile(
            leading: Icon(Icons.calendar_month, size: 28),
            title: Text('My Weekly Activity'),
            onTap: () {},
          ),
          // Terms and Conditions
          ListTile(
            leading: Icon(Icons.book, size: 28),
            title: Text('Terms and Conditions'),
            onTap: () {},
          ),
          // Help and Support
          ListTile(
            leading: Icon(Icons.help, size: 28),
            title: Text('Help and Support'),
            onTap: () {},
          ),
          // Log out
          ListTile(
            leading: Icon(Icons.logout, size: 28),
            title: Text('Log out'),
            onTap: () {},
          ),
          // Delete account and share
          ListTile(
            leading: Icon(Icons.delete, size: 28),
            title: Text('Delete account and share'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
