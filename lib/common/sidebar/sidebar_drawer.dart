import 'package:app_test/features/chatbot/chatbot_screen.dart';
import 'package:app_test/features/journal/journal_screen.dart';
import 'package:app_test/features/scenarios/scenarios_screen.dart';
import 'package:app_test/features/settings/settings.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  __SidebarState createState() => __SidebarState();
}

class __SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('JD'),
            ),
            decoration: BoxDecoration(
              color: TColors.primary,
            ),
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Iconsax.user),
                SizedBox(
                  width: TSizes.spaceBtwSections,
                ),
                Text('ChatBot'),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChatbotScreen()));
            },
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Iconsax.book),
                SizedBox(
                  width: TSizes.spaceBtwSections,
                ),
                Text('Journal'),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JournalScreen()));
            },
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Iconsax.mask),
                SizedBox(
                  width: TSizes.spaceBtwSections,
                ),
                Text('Scenarios'),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScenariosScreen()));
            },
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Iconsax.activity),
                SizedBox(
                  width: TSizes.spaceBtwSections,
                ),
                Text('Activities'),
              ],
            ),
            onTap: () {
              AlertDialog(
                title: const Text('Activities'),
                content: const Text('Coming soon'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Iconsax.bucket),
                SizedBox(
                  width: TSizes.spaceBtwSections,
                ),
                Text('Data and Analysis'),
              ],
            ),
            onTap: () {
              AlertDialog(
                title: const Text('Data and Analysis'),
                content: const Text('Coming soon'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Iconsax.settings),
                SizedBox(
                  width: TSizes.spaceBtwSections,
                ),
                Text('Settings'),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
