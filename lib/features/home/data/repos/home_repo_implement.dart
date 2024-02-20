import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tt_2/core/errors/failur.dart';
import 'package:tt_2/core/utils/api_service.dart';
import 'package:tt_2/features/home/data/models/book_model/book_model.dart';
import 'package:tt_2/features/home/data/repos/home_repo.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplement({required this.apiService});
  @override
  Future<Either<Failer, List<BookModel>>> fetchNewstBooks() async {
    try {
      var data = await apiService.get(
          endpoint: //programming       computer science   kids
              'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:computer science');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioException(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }

  @override
  Future<Either<Failer, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioException(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }

  @override
  Future<Either<Failer, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:programming');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioException(e));
      } else {
        return left(ServerFailer(e.toString()));
      }
    }
  }
}
