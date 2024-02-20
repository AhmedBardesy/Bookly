import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_2/core/widgets/custom_error_widget.dart';
import 'package:tt_2/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:tt_2/features/search/presentation/view_model/cubit/search_cubit.dart';

import 'widgets/custom_search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const CustomSearchTextField(),
            Expanded(child: SearchResulsListView())
          ],
        ),
      ),
    ));
  }
}

class SearchResulsListView extends StatelessWidget {
  const SearchResulsListView({super.key});
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
            child: Text("Search"),
          );
        } else if (state is SearchSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length ,
            itemBuilder: (context, index) {
              return Padding(
                padding:const EdgeInsets.symmetric(vertical: 10),
                child: BestsellerlistviewItem(bookmodel: state.books[index]),
              );
            },
          );
        } else if (state is SearchFailer) {
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
