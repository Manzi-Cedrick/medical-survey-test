import 'package:flutter/material.dart';

class TSectionHeader extends StatelessWidget {
  const TSectionHeader({ super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.bold,
      )
    );
  }
}