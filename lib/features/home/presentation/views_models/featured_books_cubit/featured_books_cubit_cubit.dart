import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_2/features/home/data/models/book_model/book_model.dart';
import 'package:tt_2/features/home/data/repos/home_repo.dart';

part 'featured_books_cubit_state.dart';

class FeaturedBooksCubitCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubitCubit(this.homeRepo) : super(FeaturedBooksCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksCubitLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failer) {
      emit(FeaturedBooksCubitFailer(failer.errorMessage));
    }, (books) {
      emit(FeaturedBooksCubitSuccess(books));
    });
  }
}
