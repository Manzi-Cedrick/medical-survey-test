import 'package:flutter/material.dart';

class TImageHeader extends StatelessWidget {
  const TImageHeader({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Image(image: AssetImage(image)),
    );
  }
}