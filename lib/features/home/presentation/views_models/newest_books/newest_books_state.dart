part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestdBooksCubitLoading extends NewestBooksState {}

final class NewestdBooksCubitSuccess extends NewestBooksState {
  final List<BookModel> books;

  const NewestdBooksCubitSuccess(this.books);
}

final class NewestdBooksCubitFailer extends NewestBooksState {
  final String errorMessage;

  const NewestdBooksCubitFailer(this.errorMessage);
}
