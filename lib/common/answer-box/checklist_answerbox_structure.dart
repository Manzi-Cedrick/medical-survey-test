import 'package:flutter/material.dart';

class TCheckListAnswerBox extends StatefulWidget {
  const TCheckListAnswerBox({
    Key? key,
    required this.items,
    required this.checkList,
    required this.onChanged,
  }) : super(key: key);

  final List<String> items;
  final List<bool> checkList;
  final ValueChanged<List<bool>> onChanged;

  @override
  _TCheckListAnswerBoxState createState() => _TCheckListAnswerBoxState();
}

class _TCheckListAnswerBoxState extends State<TCheckListAnswerBox> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (context, index) => CheckboxListTile(
          value: widget.checkList[index],
          onChanged: (bool? value) {
            setState(() {
              widget.checkList[index] = value ?? false; // Update the checkbox status
              widget.onChanged(widget.checkList); // Notify the parent about the change
            });
          },
          title: Text(widget.items[index]),
        ),
      ),
    );
  }
}
