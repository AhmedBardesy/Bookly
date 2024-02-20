import 'package:flutter/material.dart';
import 'package:tt_2/core/utils/styles.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errorMessage,
      style: Styles.textStyle18,
    ));
  }
}
