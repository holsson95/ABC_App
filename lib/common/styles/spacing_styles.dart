import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class SpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: Sizes.appBarHeight,
    left: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
    bottom: Sizes.defaultSpace
  );
}