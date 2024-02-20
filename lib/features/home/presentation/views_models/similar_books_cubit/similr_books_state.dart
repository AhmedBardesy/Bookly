part of 'similr_books_cubit.dart';

sealed class SimilrBooksState extends Equatable {
  const SimilrBooksState();

  @override
  List<Object> get props => [];
}

final class SimilrBooksInitial extends SimilrBooksState {}

final class SimilrBooksLoading extends SimilrBooksState {}

final class SimilrBooksSuccess extends SimilrBooksState {
  final List<BookModel> books;

  const SimilrBooksSuccess({required this.books});
}

final class SimilrBooksFailer extends SimilrBooksState {
  final String errorMessge;

  const SimilrBooksFailer({required this.errorMessge});
}
