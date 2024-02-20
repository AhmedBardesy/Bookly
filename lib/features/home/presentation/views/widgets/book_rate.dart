import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class BookRate extends StatelessWidget {
  const BookRate(
      {super.key,
      this.mainaxces = MainAxisAlignment.start,
      required this.rating,
      required this.count});
  final MainAxisAlignment mainaxces;
  final num rating;
  final num count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainaxces,
      children: [
        const Icon(
          weight: 14,
          Icons.star_rounded,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: 6.8,
        ),
        Text(
          '$rating',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '($count)',
          style: Styles.textStyle14.copyWith(color: Color(0xff707070)),
        ),
      ],
    );
  }
}
