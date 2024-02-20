import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_2/core/widgets/custom_error_widget.dart';
import 'package:tt_2/features/home/presentation/views/widgets/custom_item.dart';
import 'package:tt_2/features/home/presentation/views_models/similar_books_cubit/similr_books_cubit.dart';

import '../../../../../core/utils/styles.dart';

class BookDetailTitle extends StatelessWidget {
  const BookDetailTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'You can also like',
      style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilrBooksCubit, SimilrBooksState>(
      builder: (context, state) {
        if (state is SimilrBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: CustomItem(
                    ImageUrl: state
                            .books[index].volumeInfo?.imageLinks?.thumbnail ??
                        'https://upload.wikimedia.org/wikipedia/commons/4/42/Football_in_Bloomington%2C_Indiana%2C_1995.jpg'),
              ),
            ),
          );
        } else if (state is SimilrBooksFailer) {
          return CustomErrorMessage(errorMessage: state.errorMessge);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
