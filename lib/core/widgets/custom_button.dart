import 'package:flutter/material.dart';
import 'package:tt_2/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgrouncolor,
    required this.textColor,
    this.borderRadius,
    required this.text,
    this.fontsize, 
    required this.onPressed,
  });
  final Color backgrouncolor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontsize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgrouncolor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
