import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: TSizes.sm,
      left: TSizes.defaultSpace,
      bottom: TSizes.defaultSpace,
      right: TSizes.defaultSpace);

  static const EdgeInsetsGeometry defaultPaddingWithAppBarHeight = EdgeInsets.only(
      top: TSizes.sm,
      left: TSizes.defaultSpace * 2.5,
      bottom: TSizes.defaultSpace,
      right: TSizes.defaultSpace * 2.5);
}