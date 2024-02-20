import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tt_2/features/home/data/models/book_model/book_model.dart';
import 'package:tt_2/features/home/data/repos/home_repo.dart';

part 'similr_books_state.dart';

class SimilrBooksCubit extends Cubit<SimilrBooksState> {
  SimilrBooksCubit(this.homeRepo) : super(SimilrBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilrBooksLoading());

    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((l) {
      emit(SimilrBooksFailer(errorMessge: l.errorMessage));
    }, (r) {
      emit(SimilrBooksSuccess(books: r));
    });
  }
}
