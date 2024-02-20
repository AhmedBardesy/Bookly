import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_2/features/search/presentation/view_model/cubit/search_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value)async {
        await  BlocProvider.of<SearchCubit>(context).SearchResult(search: value);
      },
      // onChanged: (value) {
      
      // },
      decoration: InputDecoration(
          enabledBorder: textfieldborder(),
          focusedBorder: textfieldborder(),
          hintText: 'Search',
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 22,
              ))),
    );
  }

  OutlineInputBorder textfieldborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white));
  }
}
