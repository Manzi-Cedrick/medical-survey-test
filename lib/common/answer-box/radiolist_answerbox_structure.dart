import 'package:flutter/material.dart';

class TRadioListAnswerBox extends StatefulWidget {
  const TRadioListAnswerBox({
    Key? key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  final List<String> items;
  final int? selectedValue; // Store the selected value instead of a list of boolean values
  final ValueChanged<int> onChanged;

  @override
  _TRadioListAnswerBoxState createState() => _TRadioListAnswerBoxState();

}
class _TRadioListAnswerBoxState extends State<TRadioListAnswerBox> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: Radio<int>(
            value: index,
            groupValue: widget.selectedValue,
            onChanged: (int? value) {
              setState(() {
                widget.onChanged(value!); // Notify the parent about the change
              });
            },
          ),
          title: Text(widget.items[index]),
        ),
      ),
    );
  }
}
