import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_2/core/utils/styles.dart';
import 'package:tt_2/features/home/data/models/book_model/book_model.dart';
import 'package:tt_2/features/home/presentation/views/widgets/book_action.dart';
import 'package:tt_2/features/home/presentation/views/widgets/book_detail_listview.dart';
import 'package:tt_2/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:tt_2/features/home/presentation/views/widgets/book_rate.dart';
import 'package:tt_2/features/home/presentation/views/widgets/custom_item.dart';
import 'package:tt_2/features/home/presentation/views_models/similar_books_cubit/similr_books_cubit.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    BlocProvider.of<SimilrBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea( 
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const CustomaBookDetaisAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .2),
                    child: CustomItem(
                        ImageUrl: widget
                                .bookModel.volumeInfo?.imageLinks?.thumbnail ??
                            'https://upload.wikimedia.org/wikipedia/commons/4/42/Football_in_Bloomington%2C_Indiana%2C_1995.jpg'),
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                  Text(
                    widget.bookModel.volumeInfo?.title ?? '',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle30
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Opacity(
                    opacity: .7,
                    child: Text(widget.bookModel.volumeInfo?.authors?[0] ?? '',
                        style: Styles.textStyle18),
                  ),
                  //***** */
                  BookRate(
                    count: widget.bookModel.volumeInfo?.averageRating ?? 0,
                    rating: widget.bookModel.volumeInfo?.ratingsCount ?? 0,
                    mainaxces: MainAxisAlignment.center,
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                   BooksActions(bookmodel: widget.bookModel),
                  const Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: BookDetailTitle(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const BookDetailsListView(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
