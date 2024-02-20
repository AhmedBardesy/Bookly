import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_2/features/home/data/repos/home_repo.dart';

import '../../../data/models/book_model/book_model.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future fetchNewestBooks() async {
    var response = await homeRepo.fetchNewstBooks();
    response.fold((failer) {
      emit(NewestdBooksCubitFailer(failer.errorMessage));
    }, (books) {
      emit(NewestdBooksCubitSuccess(books));
    });
  }
} 
 