import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tt_2/core/utils/api_service.dart';
import 'package:tt_2/core/utils/servace_locator.dart';
import 'package:tt_2/features/home/data/models/book_model/book_model.dart';
import 'package:tt_2/features/home/data/repos/home_repo_implement.dart';
import 'package:tt_2/features/home/presentation/views/home_view.dart';
import 'package:tt_2/features/home/presentation/views_models/similar_books_cubit/similr_books_cubit.dart';
import 'package:tt_2/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:tt_2/features/search/presentation/views/search_view.dart';
import 'package:tt_2/features/splash/views/splash_view.dart';

import '../../features/home/presentation/views/book_details_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeview',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/searchview',
        builder: (context, state) =>  BlocProvider(
          create: (context) =>SearchCubit( getIt.get<ApiService>()),
          child: SearchView(),
        ),
      ),
      GoRoute(
        path: '/bookdetails',
        builder: (context, state) => BlocProvider(
            create: (context) => SimilrBooksCubit(
                  getIt.get<HomeRepoImplement>(),
                ),
            child: BookDetails(
              bookModel: state.extra as BookModel,
            )),
      ),
    ],
  );
}
