import 'package:dartz/dartz.dart';
import 'package:tt_2/core/errors/failur.dart';
import 'package:tt_2/features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failer, List<BookModel>>> fetchNewstBooks();
  Future<Either<Failer, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failer, List<BookModel>>> fetchSimilarBooks({required String category});
}
