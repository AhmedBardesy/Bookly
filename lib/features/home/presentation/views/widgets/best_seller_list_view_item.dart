import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tt_2/features/home/data/models/book_model/book_model.dart';
import 'package:tt_2/features/home/presentation/views/widgets/book_rate.dart';

import '../../../../../core/utils/styles.dart';

class BestsellerlistviewItem extends StatelessWidget {
  const BestsellerlistviewItem({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/bookdetails',extra:bookmodel );
        },
        child: SizedBox(
          height: 130,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.5 / 4,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: bookmodel.volumeInfo!.imageLinks?.thumbnail ?? '',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookmodel.volumeInfo!.title!,
                        style: Styles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      bookmodel.volumeInfo!.authors?[0] ?? 'none',
                      style: Styles.textStyle14,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        BookRate(
                          rating:
                              bookmodel.volumeInfo!.averageRating?.toInt() ?? 0,
                          count: bookmodel.volumeInfo!.ratingsCount ?? 0,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
