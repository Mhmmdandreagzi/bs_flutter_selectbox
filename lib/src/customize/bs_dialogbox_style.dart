import 'package:flutter/material.dart';

class BsDialogBoxStyle {
  const BsDialogBoxStyle(
      {this.itemColor,
      this.itemTextColor,
      this.borderRadius,
      this.backgroundColor,
      this.border,
      this.glasBlur,
      this.glasColor,
      this.boxShadow});

  final Color? itemColor;

  final Color? itemTextColor;

  final Color? backgroundColor;

  final Color? glasColor;

  final double? glasBlur;

  final BorderRadius? borderRadius;

  final Border? border;

  final List<BoxShadow>? boxShadow;
}
