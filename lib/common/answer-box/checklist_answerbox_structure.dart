import 'package:flutter/material.dart';

class TCheckListAnswerBox extends StatelessWidget {
  const TCheckListAnswerBox({
    Key? key,
    required this.items,
    required this.checkList,
    required this.onChanged,
  }) : super(key: key);

  final List<String> items;
  final List<bool> checkList;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) => CheckboxListTile(
          value: checkList[index],
          onChanged: onChanged,
          title: Text(items[index]),
        ),
      ),
    );
  }
}