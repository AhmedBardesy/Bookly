import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_2/core/widgets/custom_error_widget.dart';
import 'package:tt_2/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:tt_2/features/home/presentation/views_models/newest_books/newest_books_cubit.dart';

import '../../../../../core/utils/styles.dart';

class BestSellerListViewHome extends StatelessWidget {
  const BestSellerListViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestdBooksCubitSuccess) {
          print(' state.books.length :${state.books.length}');
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestsellerlistviewItem(bookmodel: state.books[index]),
              );
            },
          );
        } else if (state is NewestdBooksCubitFailer) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class Pagetitle extends StatelessWidget {
  const Pagetitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50, left: 20, bottom: 20),
      child: Text(
        'Best Seller',
        style: Styles.textStyle18,
      ),
    );
  }
}
