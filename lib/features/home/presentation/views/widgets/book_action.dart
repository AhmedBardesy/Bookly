import 'package:flutter/material.dart';
import 'package:tt_2/features/home/data/models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {},
              text: 'Free',
              backgrouncolor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                var url = Uri.parse(bookmodel.volumeInfo!.previewLink!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print('ERROR Launching URL');
                }
              },
              fontsize: 16,
              text: 'Free Preview',
              backgrouncolor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
