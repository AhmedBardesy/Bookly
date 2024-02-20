import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tt_2/core/widgets/custom_error_widget.dart';
import 'package:tt_2/features/home/presentation/views_models/featured_books_cubit/featured_books_cubit_cubit.dart';

import 'custom_item.dart';

class CustomListViewHorizontal extends StatelessWidget {
  const CustomListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubitCubit, FeaturedBooksCubitState>(
      builder: (context, state) {
        if (state is FeaturedBooksCubitSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push('/bookdetails', extra: state.books[index]);
                  },
                  child: CustomItem(
                    ImageUrl:
                        state.books[index].volumeInfo!.imageLinks?.thumbnail ??
                            '',
                  ),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksCubitFailer) {
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
