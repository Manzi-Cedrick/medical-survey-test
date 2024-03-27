import 'package:app_test/common/style/appbar_style.dart';
import 'package:app_test/features/scenarios/action_tab.dart';
import 'package:app_test/features/scenarios/dilemmas_tab.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ScenariosScreen extends StatefulWidget {
  const ScenariosScreen({Key? key}) : super(key: key);
  @override
  _ScenariosScreenState createState() => _ScenariosScreenState();
}

class _ScenariosScreenState extends State<ScenariosScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scenarios'),
          leading: IconButton(
              color: TColors.black,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Iconsax.arrow_left)),
          bottom: TabBar(tabs: [
            Tab(text: 'What would you do?'),
            Tab(text: 'Ethical Dilemmas')
          ]),
        ),
        body: const TabBarView(children: [
          ActionDoAble(),
          DilemmasTab()
        ])
      ),
    );
  }
}