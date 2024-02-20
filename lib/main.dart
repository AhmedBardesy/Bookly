import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_2/constance.dart';
import 'package:tt_2/core/utils/routs.dart';
import 'package:tt_2/core/utils/servace_locator.dart';
import 'package:tt_2/features/home/data/repos/home_repo_implement.dart';
import 'package:tt_2/features/home/presentation/views_models/featured_books_cubit/featured_books_cubit_cubit.dart';
import 'package:tt_2/features/home/presentation/views_models/newest_books/newest_books_cubit.dart';

void main() {
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatefulWidget {
  const BooklyApp({super.key});

  @override
  State<BooklyApp> createState() => _BooklyAppState();
}

class _BooklyAppState extends State<BooklyApp> {
  final getit = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubitCubit(getit.get<HomeRepoImplement>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getit.get<HomeRepoImplement>())
            ..fetchNewestBooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: KprimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  } 
}
