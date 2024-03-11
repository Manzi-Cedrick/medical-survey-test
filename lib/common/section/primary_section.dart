import 'package:app_test/common/style/spacing_style.dart';
import 'package:flutter/material.dart';

class TPrimarySectionLayout extends StatelessWidget {
  const TPrimarySectionLayout({ super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: child
      ),
    );
  }
}