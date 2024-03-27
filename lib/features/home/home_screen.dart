import 'package:app_test/common/sidebar/sidebar_drawer.dart';
import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/features/home/widgets/calendar_date_picker.dart';
import 'package:app_test/features/home/widgets/grid_list_view.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      drawer: const Sidebar(),
      body: const SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            CalendarDatePickerCustom(),
            SizedBox(height: TSizes.spaceBtwSections),
            GridViewList()
          ],
        ),
      ),
    );
  }
}
