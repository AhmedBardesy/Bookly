import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_2/core/utils/api_service.dart';
import 'package:tt_2/features/home/data/models/book_model/book_model.dart';

import '../../../../../core/errors/failur.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.apiService) : super(SearchInitial());
  final ApiService apiService;

  Future<Either<Failer, List<BookModel>>> SearchResult(
      {required String search}) async {
    try {
      emit(SearchLoading());
      var data = await apiService.get(

          //volumes?Filtering=free-ebooks&q=subject:kids&Sorting=newest
          endpoint:
              'volumes?Filtering=free-ebooks&q=subject:$search&Sorting=newest');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
        emit(SearchSuccess(books: books));
      }
      emit(SearchSuccess(books: books));
      return right(books);
    } catch (e) {
      emit(SearchFailer(errorMessage: e.toString()));
      if (e is DioException) {
        return left(ServerFailer.fromDioException(e));
      } else {
        return left(ServerFailer(e.toString()));
      }
    }
  }
}
