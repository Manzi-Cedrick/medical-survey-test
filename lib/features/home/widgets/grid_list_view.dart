import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WidgetData {
  final String name;
  final IconData icon;

  WidgetData({required this.name, required this.icon});
}

class GridViewList extends StatelessWidget {
  const GridViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<WidgetData> widgetList = [
      WidgetData(name: 'Chatbot', icon: Icons.chat),
      WidgetData(name: 'Journal', icon: Icons.book),
      WidgetData(name: 'Scenarios', icon: Icons.settings),
      WidgetData(name: 'Cognitive Activities', icon: Icons.local_activity),
    ];
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widgetList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: TColors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widgetList[index].icon,
                      size: 50,
                      color: const Color.fromARGB(255, 133, 240, 129),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      widgetList[index].name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Data and Analysis',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: TColors.white),
            ),
          ),
        )
      ],
    );
  }
}
