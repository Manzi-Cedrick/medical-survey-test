import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DilemmasTab extends StatefulWidget {
  const DilemmasTab({Key? key}) : super(key: key);

  @override
  _DilemmasTabState createState() => _DilemmasTabState();
}

class _DilemmasTabState extends State<DilemmasTab> {
  int? _selectedValue;
  List<String> _items = [
    'Save Micheal and risk my own life',
    'Let Micheal face the consequences',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: TSpacingStyle.paddingWithAppBarHeight,
      child: Column(
        children: [
          const Text(
              'Micheal and Alex who have been friends for years, They made a pact to always have each other’s back no matter what. One day, Micheal was caught in a compromising situation and Alex was the only one who could save him. Alex was faced with a dilemma, to save Micheal and risk his own life or let Micheal face the consequences of his actions. What would you do?'),
          const SizedBox(height: TSizes.spaceBtwSections),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: _items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Radio<int>(
                value: index,
                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value; // Notify the parent about the change
                  });
                },
              ),
              title: Text(_items[index]),
            ),
          ),
                    const SizedBox(height: TSizes.spaceBtwSections),

          Text('This is the best outcome for this scenario. Micheal is being saved and Alex is not risking his life.',style: Theme.of(context).textTheme.bodySmall!.apply(backgroundColor: Colors.green.shade200))
        ],
      ),
    );
  }
}
